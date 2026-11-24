**Часть 1. Стенд и подключение по паролю**

1.  <img src="./media/image33.png"
    style="width:6.49653in;height:2.61389in" />\
    <img src="./media/image36.png"
    style="width:6.49653in;height:2.24792in" />

2.  <img src="./media/image35.png"
    style="width:5.30282in;height:2.78164in" />

3.  <img src="./media/image42.png"
    style="width:6.49653in;height:3.61181in" />

4.  <img src="./media/image39.png"
    style="width:3.39631in;height:1.23976in" />

5.  <img src="./media/image48.png"
    style="width:6.49653in;height:4.53264in" />

6.  <img src="./media/image43.png"
    style="width:6.49653in;height:1.86042in" />\
    <img src="./media/image51.png"
    style="width:6.49653in;height:3.52431in" />

7.  <img src="./media/image49.png"
    style="width:6.49653in;height:0.76875in" />

8.  Проброс с основного компьютера на виртуальную машину

    <img src="./media/image61.png"
    style="width:6.49653in;height:0.48056in" />

    <img src="./media/image50.png"
    style="width:2.07757in;height:0.33709in" />

    Проброс с виртуальной машины на основной компьютер

    <img src="./media/image72.png"
    style="width:5.32156in;height:0.25484in" />

    <img src="./media/image59.png"
    style="width:6.49653in;height:0.29514in" />

    <img src="./media/image57.png"
    style="width:3.57379in;height:0.95082in" />

**Часть 2. Пользователи и группы**

1.  <img src="./media/image73.png" style="width:3.2144in;height:4.5438in" />

2.  <img src="./media/image71.png"
    style="width:2.79658in;height:2.36295in" />

3, 4, 5.\
<img src="./media/image63.png"
style="width:4.38923in;height:1.06646in" />\
<img src="./media/image66.png"
style="width:4.42857in;height:1.30861in" />\
**поля вывода:** имя : x(пароль в shadow) : UID : GID основной группы :
GECOS(комментарий) : домашний каталог :.shell\
\
<img src="./media/image65.png"
style="width:6.5272in;height:0.46608in" />

> (Видно, что хэши разные)

6\.\
<img src="./media/image67.png"
style="width:6.11152in;height:2.33747in" />\
<img src="./media/image69.png"
style="width:5.64662in;height:0.43756in" />\
Через id не показывает новую группу, но через id u3 показывает:\
<img src="./media/image23.png"
style="width:6.00084in;height:1.10432in" />\
Заново логинимся:\
<img src="./media/image24.png"
style="width:6.49653in;height:2.14028in" />

**Часть 3. Права на файлы и каталоги**

1,2,3,4 – создание правил,проверка 1:\
<img src="./media/image26.png"
style="width:5.63565in;height:4.33864in" />

Проверка прав, для u1 из группы project работает создание и удаление:\
<img src="./media/image56.png"
style="width:3.30208in;height:1.54167in" />

Для u4 не из группы project работает только чтение:\
<img src="./media/image47.png"
style="width:4.44792in;height:1.1875in" />

2,3 - проверка:

Пользователь u3 не может удалить или переименовать файл, созданный u1,
но может создать и удалить свой. Также u3 не может просматривать
директорию sec2.\
<img src="./media/image29.png"
style="width:5.64501in;height:4.12861in" />

4 – проверка:

Чтобы кто угодно мог изменять файлы в /DATA/sec2 через скопированный
редактор, владельцем копии должен стать u1, а на файл надо повесить бит
suid (4):\
<img src="./media/image31.png"
style="width:4.91735in;height:2.15655in" />

После записи в файл удостоверимся, что запись прошла:\
<img src="./media/image30.png"
style="width:3.80261in;height:1.58355in" />

5\. Риск в том, что если владельцем копии редактора будет root, то если
ставить suid 4755 на текстовый редактор, то любой пользователь сможет
получить права суперпользователя и сможет открывать и редактировать
системные файлы.\
<img src="./media/image27.png"
style="width:4.05639in;height:1.57696in" />

Команда passwd имеет suid(4), для того чтобы пользователи могли сами
менять пароли.

6\. Права и владельцев всех каталогов и файлов

<img src="./media/image68.png"
style="width:4.16667in;height:1.19792in" />В каталоге DATA:\
<img src="./media/image60.png" style="width:4.5in;height:1.34375in" />

В каталоге sec1:

В каталоге sec2:\
<img src="./media/image34.png" style="width:6.25in;height:1.54167in" /><img src="./media/image10.png" style="width:4.5in;height:1.57292in" />

В каталоге sec3:\
<img src="./media/image18.png" style="width:3.72917in;height:1.125in" />

**Часть 4. Аутентификация по ключам SSH**

1\.

<img src="./media/image53.png"
style="width:4.99529in;height:3.38623in" />

<img src="./media/image16.png"
style="width:4.78021in;height:1.96877in" />

2\.

Копирование ключа в ВМ:

<img src="./media/image28.png"
style="width:3.53229in;height:0.72457in" /><img src="./media/image70.png"
style="width:4.76979in;height:0.40393in" />

<img src="./media/image20.png"
style="width:5.89479in;height:1.8988in" />

3**\**
<img src="./media/image11.png"
style="width:5.94688in;height:2.32538in" />**\**
<img src="./media/image13.png"
style="width:6.49619in;height:3.19444in" />

4\
<img src="./media/image15.png"
style="width:4.58333in;height:0.78125in" />

<img src="./media/image37.png"
style="width:6.49619in;height:1.11111in" />

<img src="./media/image3.png"
style="width:5.54063in;height:4.02228in" />

5 Проверка входа:

По ssh не получается зайти root или без аутентификации по ключу:\
<img src="./media/image7.png"
style="width:6.49619in;height:3.13889in" />

6 Проброс файла script31:\
<img src="./media/image46.png"
style="width:6.49619in;height:0.54167in" />

**Часть 5. su, sudo, процессы и фоновый запуск**

1,2\
<img src="./media/image45.png"
style="width:6.49619in;height:6.11111in" />

3\
<img src="./media/image22.png"
style="width:6.49619in;height:0.86111in" />

4\
Проверки из сессии u1 так как вход по ssh по паролю уже запрещен:\
<img src="./media/image62.png"
style="width:6.49619in;height:4.13889in" />

5\
<img src="./media/image52.png" style="width:6.49619in;height:4.125in" />

6\
<img src="./media/image64.png"
style="width:6.49619in;height:2.34722in" />

systemd(1)───sshd(690)───sshd-session(785)───sshd-session(809)───sh(810)───code-69047191fc(828)───sh(919)───MainThread(923)───MainThread(986)───bash(1106)───su(3340)───bash(3359)───pstree(10372)

7

<img src="./media/image17.png"
style="width:3.16667in;height:0.61458in" />\
<img src="./media/image58.png"
style="width:5.16667in;height:0.77083in" /><img src="./media/image14.png"
style="width:3.1875in;height:0.17708in" />\
<img src="./media/image21.png"
style="width:2.73958in;height:0.57292in" />

<img src="./media/image6.png"
style="width:4.88542in;height:0.72917in" />\
<img src="./media/image4.png" style="width:2.72917in;height:0.4375in" />

Различие между sigterm и sigkill в принудительности уничтожения
процесса:

sigterm - подает сигнал самой программе, она может проигнорировать
его(зависла или так настроена), перехватить его, выполнив перед выходом
корректное завершение работы.

sigkill - принудительное уничтожение на уровне ядра ОС. Сигнал
передается не программе, а ядру, таким образом, завершая любой процесс,
но с угрозой потери данных или их повреждения.

8

Приостановили:\
<img src="./media/image25.png"
style="width:5.79167in;height:1.66667in" />\
<img src="./media/image2.png"
style="width:4.72917in;height:0.61458in" />

Запустили:\
<img src="./media/image9.png"
style="width:5.54167in;height:1.09375in" />

9

<img src="./media/image19.png" style="width:6.49619in;height:1.25in" />

10<img src="./media/image55.png"
style="width:2.94881in;height:2.71771in" />

<img src="./media/image12.png"
style="width:3.3089in;height:1.39501in" />

11\.

<img src="./media/image38.png"
style="width:4.04167in;height:0.76042in" />\
<img src="./media/image8.png"
style="width:5.59375in;height:2.28125in" />

<img src="./media/image5.png"
style="width:5.58333in;height:1.35417in" />\
<img src="./media/image44.png"
style="width:5.66667in;height:1.73958in" />

12\.

1.  Когда пользователь выходит из терминала или обрывается
    ssh-соединение, то системы посылает всем процессам этой сессии
    сигнал sighup, который по умолчанию завершает программу.

    Команда nohup запускает скрипт так чтобы он игнорировал сигнал
    sighup, а также отвязывает его стандартный ввод/вывод от терминала,
    перенаправляя в nohup.out:\
    <img src="./media/image40.png"
    style="width:2.39583in;height:0.34375in" />. Поэтому после закрытия
    сессии скрипт продолжает работать.

2.  PPID стал равен 1 потому что при обычном запуске родителем (PPID)
    скрипта является процесс оболочки bash.

    Когда мы выходим из сессии (exit) родительский процесс завершается и
    исчезает, а уже запущенный процесс script32 продолжает работать
    благодаря nohup.

    Так как процесса без родителя существовать не может, то
    автоматически этому процессу назначается родитель с PID 1 - ядро ОС.

**Часть 6. Аудит безопасности в скрипте инвентаризации**

Запуск с правами root:<img src="./media/image32.png"
style="width:4.98021in;height:1.65708in" />

Запуск под пользователем с правами sudo:<img src="./media/image41.png"
style="width:5.19896in;height:2.34131in" />

Запуск под пользователем без прав (недоступен, код ошибки 1):\
<img src="./media/image54.png"
style="width:6.49619in;height:0.76389in" />

Базовые проверки:\
<img src="./media/image1.png"
style="width:5.23021in;height:3.12639in" />

*PASSPORT/inventory.txt:*

\`\`\`\
=== ОТЧЁТ: инвентаризация и аудит безопасности (формат v3) ===

Дата формирования: Mon Nov 23 05:53:27 PM MSK 2026

Запустил: bdk-1 (права: bdk-1, группа sudo)

=== kernel info ===

6.12.107+deb13-amd64

x86_64

=== os version ===

DEBIAN_VERSION_FULL=13.7

=== cpu model ===

Model name: AMD Ryzen 5 7430U with Radeon Graphics

=== frequency ===

cpu MHz : 2295.630

cpu MHz : 2295.630

=== core number ===

CPU(s): 2

=== cpu cache ===

L1d cache: 64 KiB (2 instances)

L1i cache: 64 KiB (2 instances)

L2 cache: 1 MiB (2 instances)

L3 cache: 32 MiB (2 instances)

=== memory ===

total used free shared buff/cache available

Mem: 967Mi 771Mi 77Mi 40Ki 251Mi 195Mi

Swap: 1.0Gi 150Mi 871Mi

=== baseboard ===

Manufacturer: Oracle Corporation

Product Name: VirtualBox

=== bios ===

Vendor: innotek GmbH

Version: VirtualBox

Release Date: 12/01/2006

=== pci ===

00:00.0 Host bridge: Intel Corporation 440FX - 82441FX PMC \[Natoma\]
(rev 02)

00:01.0 ISA bridge: Intel Corporation 82371SB PIIX3 ISA \[Natoma/Triton
II\]

00:02.0 VGA compatible controller: InnoTek Systemberatung GmbH
VirtualBox Graphics Adapter

00:03.0 Ethernet controller: Intel Corporation 82540EM Gigabit Ethernet
Controller (rev 02)

00:04.0 System peripheral: InnoTek Systemberatung GmbH VirtualBox Guest
Service

00:05.0 Audio device: Intel Corporation 82801FB/FBM/FR/FW/FRW (ICH6
Family) High Definition Audio Controller (rev 01)

00:07.0 Bridge: Intel Corporation 82371AB/EB/MB PIIX4 ACPI (rev 08)

00:0c.0 USB controller: Intel Corporation 7 Series/C210 Series Chipset
Family USB xHCI Host Controller

00:0d.0 SATA controller: Intel Corporation 82801HM/HEM (ICH8M/ICH8M-E)
SATA Controller \[AHCI mode\] (rev 02)

=== Пользователи ===

Пользователь: root (UID 0)

группы: root

последний вход: root pts/5 10.0.2.2 Sun Nov 15 16:32:30 +0300 2026

последняя смена пароля: Nov 15, 2026

Пользователь: nobody (UID 65534)

группы: nogroup

последний вход: нет данных

последняя смена пароля: Sep 16, 2026

Пользователь: myuser (UID 1000)

группы: myuser cdrom floppy sudo audio dip video plugdev users netdev
bluetooth sharegroup

последний вход: myuser ssh 10.0.2.2 Mon Nov 23 20:15:25 +0300 2026

последняя смена пароля: Sep 16, 2026

Пользователь: bdk-1 (UID 1001)

группы: bdk-1 sudo users sharegroup

последний вход: bdk-1 pts/0 Mon Nov 23 17:47:36 +0300 2026

последняя смена пароля: Oct 29, 2026

Пользователь: u1 (UID 1002)

группы: u1 users project

последний вход: нет данных

последняя смена пароля: Nov 12, 2026

Пользователь: u2 (UID 1003)

группы: u2 users project

последний вход: нет данных

последняя смена пароля: Nov 15, 2026

Пользователь: u3 (UID 1004)

группы: u3 users project

последний вход: нет данных

последняя смена пароля: Nov 12, 2026

Пользователь: u4 (UID 1005)

группы: u4 users readers

последний вход: нет данных

последняя смена пароля: Nov 12, 2026

Пользователь: u5 (UID 1006)

группы: u5 users readers

последний вход: нет данных

последняя смена пароля: Nov 12, 2026

=== Параметры sshd (эффективные значения) ===

permitrootlogin = no (задан в конфигурации)

port = 22 (по умолчанию)

logingracetime = 30 (задан в конфигурации)

maxauthtries = 2 (задан в конфигурации)

passwordauthentication = no (задан в конфигурации)

pubkeyauthentication = yes (задан в конфигурации)

=== Топ-5 процессов по использованию памяти ===

PID PPID USER %MEM COMMAND

913 880 myuser 37.8 MainThread

924 880 myuser 11.5 MainThread

880 876 myuser 9.1 MainThread

992 924 myuser 8.3 copilot-runtime

1519 913 myuser 7.3 MainThread

=== Подозрительные учётные записи ===

Пользователи с пустым паролем: не обнаружено

Пользователи с UID 0 кроме root: не обнаружено

=== Файлы с suid в /usr/bin и /usr/sbin ===

/usr/bin/chfn

/usr/bin/newgrp

/usr/bin/passwd

/usr/bin/chsh

/usr/bin/umount

/usr/bin/gpasswd

/usr/bin/su

/usr/bin/mount

/usr/bin/sudo\
\`\`\`

*PASSPORT/log/report.log:\*
\`\`\`\
2026-11-23 23:17:12 \| script_passport_v3 \| формат отчёта: v3 \|
пользователь: bdk-1 \| отчёт: PASSPORT/inventory.txt

2026-11-23 23:17:23 \| script_passport_v3 \| формат отчёта: v3 \|
пользователь: root \| отчёт: PASSPORT/inventory.txt\
\`\`\`

**Вопросы и задания**

**1. Зачем при создании SSH-ключа предлагается задать парольную фразу и
от какой угрозы она защищает?**

**2. Зачем при первом подключении по SSH клиент показывает отпечаток
ключа сервера и просит подтвердить его? Что произойдёт, если отпечаток
изменится?**

**3. Если у двух пользователей одинаковые пароли, можно ли понять это по
/etc/shadow? Почему?**

**4. Заполните таблицу: атрибут (r, w, x, suid, sgid, sticky bit),
сокращённое название, значение для файла, значение для каталога. В
таблице должно быть 6 строк.**

**5. Почему для удаления файла нужны права на каталог, а не на файл?
Какие изменения вносит установка sticky bit на каталог?**

**6. Приведите команду setfacl, которая даёт конкретному пользователю
все права на файл, не делая его владельцем и не добавляя в группы. Как
решить с помощью ACL задание 3 из Части 3?**

**7. Чем различаются su, su - и sudo? Почему в Debian для повседневной
работы рекомендуют sudo, а не пароль root?**

**8. Удалось ли вам обойти ограничение sudo из Части 5, Блок А? Почему
правила с подстановочными знаками в sudoers считаются опасными?**

**9. Чем отличается SIGTERM от SIGKILL? Какой из них процесс может
перехватить?**

**10. Что происходит с процессом, запущенным через &, при закрытии
SSH-сессии, и почему nohup меняет это поведение? Почему у процесса с
nohup PPID после этого стал другим?**

**11. Что такое зомби-процесс? Можно ли его убить командой kill -9 и
почему?**

**12. Чем отличается вывод sshd -T от строк, найденных в sshd_config
через grep? Приведите пример параметра, у которого они различаются.**

**13. Какой риск возникает, если владельцем исполняемого файла будет
rootи на этот файл будет установлен suid?**
