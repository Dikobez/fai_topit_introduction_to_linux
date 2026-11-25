#!/bin/bash

export PATH=$PATH:/usr/sbin

# ФУНКЦИИ

# Справка по использованию (вызывается при -h)
usage() {
    echo "Использование: ./script_passport_v3.sh [файл_отчёта]"
    echo "  файл_отчёта — куда сохранить отчёт (по умолчанию PASSPORT/inventory.txt)"
    echo "  -h, --help  — показать эту справку"
    echo "Скрипт требует прав root или членства в группе sudo."
    exit 0
}

# Сообщение об ошибке в stderr
die() {
    echo "ОШИБКА: $1" >&2
    exit "${2:-1}"
}

# Проверка прав
check_privileges() {
    if [ "$(id -u)" -eq 0 ]; then
        PRIV_INFO="root"
        return 0
    fi
    if id -nG | grep -qw sudo; then
        PRIV_INFO="$(whoami), группа sudo"
        SUDO="sudo"
        return 0
    fi
    die "недостаточно прав. Запустите скрипт от root или от пользователя из группы sudo"
}

# Проверка утилиты в системе. $1 - имя утилиты, $2 - пакет, который её ставит
check_tool() {
    if which "$1" >/dev/null 2>&1; then
        return 0
    fi
    echo "Внимание: утилита '$1' не найдена. Установите пакет: $2" >&2
    return 1
}

# Запись раздела в итоговый отчёт: $1 - название раздела, $2 - файл с содержимым
write_section() {
    echo "" >> "$REPORT_FILE"
    echo "=== $1 ===" >> "$REPORT_FILE"
    cat "$2" >> "$REPORT_FILE"
}

# Строка о запуске в журнал: дата, версия формата, кто запустил
log_run() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') | script_passport_v3 | формат отчёта: v3 | пользователь: $(whoami) | отчёт: $REPORT_FILE" >> "$LOG"
}

# Удаление временных файлов
cleanup() {
    find "$TMP" -type f -name "*.tmp" -delete 2>/dev/null
}

# ПАРАМЕТРЫ КОМАНДНОЙ СТРОКИ

if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    usage
fi

TMP="PASSPORT/tmp"
LOG="PASSPORT/log/report.log"
REPORT_FILE="${1:-PASSPORT/inventory.txt}"
SUDO=""
PRIV_INFO="" # права для заголовка
LASTLOG_NOTE="" # заметка по lastlog2

# ПРОВЕРКА ПРАВ И ПОДГОТОВКА

check_privileges

mkdir -p PASSPORT/log "$TMP"
mkdir -p "$(dirname "$REPORT_FILE")"

trap cleanup EXIT
trap 'exit 1' INT TERM


# 1. СБОР СЫРЫХ ДАННЫХ ВО ВРЕМЕННЫЕ ФАЙЛЫ

# --- разделы из v2 ---
date > $TMP/date_host.tmp
hostname >> $TMP/date_host.tmp
whoami > $TMP/wh.tmp
who >> $TMP/wh.tmp
pwd > $TMP/where.tmp
ls >> $TMP/where.tmp

uname -r > $TMP/kernel.tmp
uname -m >> $TMP/kernel.tmp

cat /etc/os-release > $TMP/os.tmp
lscpu > $TMP/cpu.tmp
cat /proc/cpuinfo > $TMP/proc.tmp
free -h > $TMP/mem.tmp

if check_tool dmidecode dmidecode; then
    $SUDO dmidecode -t baseboard > $TMP/bsrd.tmp
    $SUDO dmidecode -t bios > $TMP/bios.tmp
else
    echo "нет данных (нужен пакет dmidecode)" > $TMP/bsrd.tmp
    echo "нет данных (нужен пакет dmidecode)" > $TMP/bios.tmp
fi

if check_tool lspci pciutils; then
    lspci > $TMP/pci.tmp
else
    echo "нет данных (нужен пакет pciutils)" > $TMP/pci.tmp
fi

# Обработка
grep "DEBIAN_VERSION_FULL" $TMP/os.tmp > $TMP/os_ver.tmp
grep "Model name" $TMP/cpu.tmp > $TMP/cpu_model.tmp
grep "MHz" $TMP/proc.tmp > $TMP/freq.tmp
grep "^CPU(s)" $TMP/cpu.tmp | head -n 1 > $TMP/cpu_num.tmp
grep -i "cache" $TMP/cpu.tmp > $TMP/cache.tmp
grep -E "Manufacturer|Product" $TMP/bsrd.tmp > $TMP/bsrd_f.tmp
[ -s $TMP/bsrd_f.tmp ] || echo "нет данных" > $TMP/bsrd_f.tmp
grep -E "Vendor|Version|Release" $TMP/bios.tmp > $TMP/bios_f.tmp
[ -s $TMP/bios_f.tmp ] || echo "нет данных" > $TMP/bios_f.tmp


# Все учётные записи системы
getent passwd > $TMP/passwd.tmp

# Данные о последних входах (lastlog2)
if check_tool lastlog2 lastlog2; then
    $SUDO lastlog2 > $TMP/lastlog.tmp 2>/dev/null
else
    > $TMP/lastlog.tmp
    LASTLOG_NOTE="нет данных о входах: утилита lastlog2 не установлена (пакет lastlog2)"
fi

# Эффективные параметры sshd
if check_tool sshd openssh-server; then
    $SUDO sshd -T > $TMP/sshd_T.tmp 2>/dev/null
else
    > $TMP/sshd_T.tmp
fi

# Явно прописанные параметры в файлах конфигурации sshd
grep -hiE '^[[:space:]]*(PermitRootLogin|Port|LoginGraceTime|MaxAuthTries|PasswordAuthentication|PubkeyAuthentication)[[:space:]]' \
    /etc/ssh/sshd_config /etc/ssh/sshd_config.d/*.conf > $TMP/sshd_conf.tmp 2>/dev/null

# Топ-5 процессов по использованию памяти
ps -eo pid,ppid,user,%mem,comm --sort=-%mem | head -n 6 > $TMP/top5.tmp

# Подозрительные учётные записи

# 1) пустой пароль
empty=$($SUDO awk -F: '$2 == "" {print $1}' /etc/shadow 2>/dev/null)
[ -n "$empty" ] || empty="не обнаружено"
# 2) UID 0 у кого-то кроме root
uid0=$(awk -F: '$3 == 0 && $1 != "root" {print $1}' /etc/passwd)
[ -n "$uid0" ] || uid0="не обнаружено"
echo "Пользователи с пустым паролем: $empty" > $TMP/suspicious.tmp
echo "Пользователи с UID 0 кроме root: $uid0" >> $TMP/suspicious.tmp

# Файлы с suid-битом в /usr/bin и /usr/sbin
find /usr/bin /usr/sbin -perm -4000 2>/dev/null > $TMP/suid.tmp
[ -s $TMP/suid.tmp ] || echo "файлы с suid не найдены" > $TMP/suid.tmp


# 2. ФОРМИРОВАНИЕ ОТЧЁТА

# Шапка отчёта
echo "=== ОТЧЁТ: инвентаризация и аудит безопасности (формат v3) ===" > "$REPORT_FILE"
echo "Дата формирования: $(date)" >> "$REPORT_FILE"
echo "Запустил: $(whoami) (права: $PRIV_INFO)" >> "$REPORT_FILE"

# passport.txt
echo "===host info===" > PASSPORT/passport.txt
cat $TMP/date_host.tmp >> PASSPORT/passport.txt
echo "===credits===" >> PASSPORT/passport.txt
cat $TMP/wh.tmp >> PASSPORT/passport.txt
echo "===path===" >> PASSPORT/passport.txt
cat $TMP/where.tmp >> PASSPORT/passport.txt

# разделы из v2
write_section "kernel info" $TMP/kernel.tmp
write_section "os version" $TMP/os_ver.tmp
write_section "cpu model" $TMP/cpu_model.tmp
write_section "frequency" $TMP/freq.tmp
write_section "core number" $TMP/cpu_num.tmp
write_section "cpu cache" $TMP/cache.tmp
write_section "memory" $TMP/mem.tmp
write_section "baseboard" $TMP/bsrd_f.tmp
write_section "bios" $TMP/bios_f.tmp
write_section "pci" $TMP/pci.tmp

# --- Пользователи ---
> $TMP/users.tmp
if [ -n "$LASTLOG_NOTE" ]; then
    echo "$LASTLOG_NOTE" >> $TMP/users.tmp
    echo "" >> $TMP/users.tmp
fi
# Берём все имена с UID >= 1000 и root
USER_LIST=$(awk -F: '$3 >= 1000 || $1 == "root" {print $1}' $TMP/passwd.tmp)
for u in $USER_LIST; do
    uid=$(id -u "$u")
    gr=$(id -nG "$u")
    # последний вход: ищем строку, начинающуюся с имени, в выводе lastlog2
    login=$(grep "^$u " $TMP/lastlog.tmp)
    [ -n "$login" ] || login="нет данных"
    # дата последней смены пароля
    pwdchange=$($SUDO env LC_ALL=C chage -l "$u" 2>/dev/null | grep "^Last password change" | cut -d: -f2 | sed 's/^ *//')
    [ -n "$pwdchange" ] || pwdchange="нет данных"
    echo "Пользователь: $u (UID $uid)" >> $TMP/users.tmp
    echo "  группы: $gr" >> $TMP/users.tmp
    echo "  последний вход: $login" >> $TMP/users.tmp
    echo "  последняя смена пароля: $pwdchange" >> $TMP/users.tmp
    echo "" >> $TMP/users.tmp
done
write_section "Пользователи" $TMP/users.tmp

# --- Параметры sshd ---
if [ -s $TMP/sshd_T.tmp ]; then
    > $TMP/sshd.tmp
    for p in permitrootlogin port logingracetime maxauthtries passwordauthentication pubkeyauthentication; do
        # эффективное значение из вывода sshd -T
        val=$(grep "^$p " $TMP/sshd_T.tmp | awk '{print $2}')
        # прописан ли параметр в файлах конфигурации
        if grep -qiE "^[[:space:]]*$p[[:space:]]" $TMP/sshd_conf.tmp; then
            src="задан в конфигурации"
        else
            src="по умолчанию"
        fi
        echo "$p = $val ($src)" >> $TMP/sshd.tmp
    done
else
    echo "нет данных: не удалось получить параметры (пакет openssh-server не установлен или нет прав)" > $TMP/sshd.tmp
fi
write_section "Параметры sshd (эффективные значения)" $TMP/sshd.tmp

write_section "Топ-5 процессов по использованию памяти" $TMP/top5.tmp
write_section "Подозрительные учётные записи" $TMP/suspicious.tmp
write_section "Файлы с suid в /usr/bin и /usr/sbin" $TMP/suid.tmp


# 3. ЛОГИРОВАНИЕ ЗАПУСКА
log_run

echo "Отчёт записан: $REPORT_FILE"
echo "Журнал: $LOG"
exit 0SS