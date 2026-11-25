## Часть 1\. Стенд и подключение по паролю

### 1.   

<img width="974" height="392" alt="image" src="https://github.com/user-attachments/assets/4e2cd9f7-789b-4bbc-a060-377cd14253ec" />

<img width="974" height="337" alt="image" src="https://github.com/user-attachments/assets/7dfe6c71-49bf-4522-ac87-0c144d625d3e" />


### 2.   

<img width="795" height="417" alt="image" src="https://github.com/user-attachments/assets/b1ccd5ec-774a-453d-b3e0-2271d8188dba" />

### 3.   

   <img width="974" height="542" alt="image" src="https://github.com/user-attachments/assets/19243dc3-28ca-4cc2-8f74-806175e3bcff" />


### 4.   
   
   <img width="509" height="186" alt="image" src="https://github.com/user-attachments/assets/9e3bad8e-8a0c-4df7-94d8-c209538539e4" />


### 5.   
   
   <img width="974" height="680" alt="image" src="https://github.com/user-attachments/assets/91bc276d-fc87-4557-ab08-641a315c4291" />


### 6.   

<img width="974" height="279" alt="image" src="https://github.com/user-attachments/assets/ab6ea9ed-508c-495b-9d58-7e820d95a1ea" />

   <img width="974" height="529" alt="image" src="https://github.com/user-attachments/assets/d24754e6-864c-4f42-82c3-cbd907b4c81a" />


### 7.

   <img width="974" height="115" alt="image" src="https://github.com/user-attachments/assets/8fbd9a1f-7ab6-4280-a18e-2ad5ebd2173f" />


### 8. Проброс с основного компьютера на виртуальную машину:

<img width="974" height="72" alt="image" src="https://github.com/user-attachments/assets/019e85ea-a183-49c2-b680-19171be10a9a" />

<img width="312" height="51" alt="image" src="https://github.com/user-attachments/assets/f580a555-5338-474f-83f6-261b87c8c323" />


#### Проброс с виртуальной машины на основной компьютер:

<img width="798" height="38" alt="image" src="https://github.com/user-attachments/assets/91566f74-47b9-466c-849b-37940e744ccd" />

<img width="974" height="44" alt="image" src="https://github.com/user-attachments/assets/af6a5767-18de-45c1-a1cc-a77412a1103d" />

<img width="536" height="143" alt="image" src="https://github.com/user-attachments/assets/f7652bf5-0e05-4df5-89a4-b663062506f9" />


## Часть 2\. Пользователи и группы

### 1.   
   <img width="482" height="682" alt="image" src="https://github.com/user-attachments/assets/a2ed89ea-adbd-47c6-a8ad-c99bdbfde9bb" />


### 2.   
   <img width="419" height="354" alt="image" src="https://github.com/user-attachments/assets/bcf2a44f-4d04-4731-bb56-01e60a7768c8" />

   

### 3, 4, 5\.   

<img width="658" height="160" alt="image" src="https://github.com/user-attachments/assets/ae67f22b-c62f-4c58-af9a-6cc2ae48d06d" />

<img width="664" height="196" alt="image" src="https://github.com/user-attachments/assets/4a0fb37b-cf28-45b2-a889-c94868eb4389" />

**поля вывода:** имя : x(пароль в shadow) : UID : GID основной группы : GECOS(комментарий) : домашний каталог :.shell

<img width="979" height="70" alt="image" src="https://github.com/user-attachments/assets/dfda7271-5f5c-4fb4-b059-60375d82a377" />

(Видно, что хэши разные)

### 6\.   

<img width="917" height="351" alt="image" src="https://github.com/user-attachments/assets/5575607b-ca3f-4b99-8b62-1301a98bcd51" />

<img width="847" height="66" alt="image" src="https://github.com/user-attachments/assets/cc7b2e17-8263-4934-9e0b-6f16feee1bfb" />

#### Через id не показывает новую группу, но через id u3 показывает:  

<img width="900" height="166" alt="image" src="https://github.com/user-attachments/assets/299d87b1-e2d7-4df5-abc1-d432fa0c6bb8" />

#### Заново логинимся:  

<img width="974" height="321" alt="image" src="https://github.com/user-attachments/assets/e07c0c75-87ec-4449-9c90-129fee0b684a" />


## Часть 3\. Права на файлы и каталоги

### 1,2,3,4 – создание правил,проверка 1:  
<img width="845" height="651" alt="image" src="https://github.com/user-attachments/assets/aac424a9-5564-42d6-bab6-182b74c9fac2" />


#### Проверка прав, для u1 из группы project работает создание и удаление:  
<img width="495" height="231" alt="image" src="https://github.com/user-attachments/assets/bfe156fd-e633-41eb-8ee9-5f6dbf12ef44" />


#### Для u4 не из группы project работает только чтение:  
<img width="667" height="178" alt="image" src="https://github.com/user-attachments/assets/f4f391b8-3280-426c-8474-92d3fa5a4f87" />


### 2,3 \- проверка:

Пользователь u3 не может удалить или переименовать файл, созданный u1, но может создать и удалить свой. Также u3 не может просматривать директорию sec2.   
<img width="847" height="619" alt="image" src="https://github.com/user-attachments/assets/cd1219d5-bd8e-49d2-a956-639b810cd9e3" />


### 4 – проверка:

#### Чтобы кто угодно мог изменять файлы в /DATA/sec2 через скопированный редактор, владельцем копии должен стать u1, а на файл надо повесить бит suid (4):  
<img width="738" height="323" alt="image" src="https://github.com/user-attachments/assets/99baa23d-9532-434c-96a0-234b99a2a792" />


#### После записи в файл удостоверимся, что запись прошла:  
<img width="570" height="238" alt="image" src="https://github.com/user-attachments/assets/38ccaa70-2771-4c8e-94ec-9b5cfe8058e2" />


### 5\. Риск в том, что если владельцем копии редактора будет root, то если ставить suid 4755 на текстовый редактор, то любой пользователь сможет получить права суперпользователя и сможет открывать и редактировать системные файлы.  
<img width="608" height="236" alt="image" src="https://github.com/user-attachments/assets/6174377b-c2d8-48f2-aaf5-370d3fe3ea9e" />


Команда passwd имеет suid(4), для того чтобы пользователи могли сами менять пароли.

### 6\. Права и владельцев всех каталогов и файлов

#### В каталоге DATA:  
<img width="675" height="202" alt="image" src="https://github.com/user-attachments/assets/e044ca7b-d52d-40f4-9e4e-e04043694d48" />


#### В каталоге sec1:
<img width="625" height="180" alt="image" src="https://github.com/user-attachments/assets/c08c6fad-8d4b-48d4-b060-dddbcb3cf1a5" />

#### В каталоге sec2:  
<img width="938" height="231" alt="image" src="https://github.com/user-attachments/assets/c90180a4-d8b5-4034-9fc4-9b01f945ba06" />

<img width="675" height="236" alt="image" src="https://github.com/user-attachments/assets/e3f66597-cf0c-4a8b-81d1-629d8d97af76" />


#### В каталоге sec3:  
<img width="559" height="169" alt="image" src="https://github.com/user-attachments/assets/0671e80c-6cdb-4c07-a546-fba5b45b1aef" />


## Часть 4\. Аутентификация по ключам SSH

### 1\.

<img width="749" height="508" alt="image" src="https://github.com/user-attachments/assets/1b0b0b4a-921f-49ed-8cab-dbb9b74e9986" />

<img width="717" height="295" alt="image" src="https://github.com/user-attachments/assets/04d9df21-021e-4ab5-aa95-b7ff07ff3d51" />


### 2\. Копирование ключа в ВМ:

<img width="530" height="109" alt="image" src="https://github.com/user-attachments/assets/f6fd27e6-e909-43c9-a8b3-6bf57c3f92ae" />
<img width="715" height="61" alt="image" src="https://github.com/user-attachments/assets/6d5df968-a91a-41fb-ba82-b6256ae40b5d" />
<img width="884" height="285" alt="image" src="https://github.com/user-attachments/assets/511cc79e-6e61-4939-a496-30cedef125e3" />


### 3  
<img width="892" height="349" alt="image" src="https://github.com/user-attachments/assets/a9ab9c1b-ac0b-48d4-983d-c6b1c99305be" />

<img width="974" height="479" alt="image" src="https://github.com/user-attachments/assets/11e29cbb-4515-4b75-a407-cbe32b9777f9" />


### 4  
<img width="688" height="117" alt="image" src="https://github.com/user-attachments/assets/9c7cb9cc-e682-42e7-80c6-86895cd58a86" />

<img width="974" height="167" alt="image" src="https://github.com/user-attachments/assets/82dbcff6-b68d-4f68-aa9e-ded7a00ad9eb" />

<img width="831" height="603" alt="image" src="https://github.com/user-attachments/assets/8f786e76-ad18-454f-b67a-3334020242a1" />


### 5 Проверка входа:

По ssh не получается зайти root или без аутентификации по ключу:  
<img width="974" height="471" alt="image" src="https://github.com/user-attachments/assets/a32a1f8f-8afa-48d1-8233-11fbff20d1ca" />


### 6 Проброс файла script31:  
<img width="974" height="81" alt="image" src="https://github.com/user-attachments/assets/c2d1fa41-a3b0-4007-b061-71acbfd60680" />


## Часть 5\. su, sudo, процессы и фоновый запуск

### 1,2  
<img width="974" height="917" alt="image" src="https://github.com/user-attachments/assets/15bac6f5-6165-411d-98ed-0d4a0832e76d" />


### 3  
<img width="974" height="129" alt="image" src="https://github.com/user-attachments/assets/1ffa23dd-56fa-491e-980c-0d5b744eb3ab" />


### 4 Проверки из сессии u1 так как вход по ssh по паролю уже запрещен:  
<img width="974" height="621" alt="image" src="https://github.com/user-attachments/assets/49e53fec-5504-4d2b-89c8-eb56b7232857" />


### 5  
<img width="974" height="619" alt="image" src="https://github.com/user-attachments/assets/48d316e9-a56a-4329-b192-c63579c923d5" />


### 6  
<img width="974" height="352" alt="image" src="https://github.com/user-attachments/assets/7b6f6b63-782b-4775-887e-c746ae5abfbc" />

#### Дерево процессов:
systemd(1)───sshd(690)───sshd-session(785)───sshd-session(809)───sh(810)───code-69047191fc(828)───sh(919)───MainThread(923)───MainThread(986)───bash(1106)───su(3340)───bash(3359)───pstree(10372)

### 7

<img width="475" height="92" alt="image" src="https://github.com/user-attachments/assets/59ec5b4f-4971-4331-9dc6-aa0303be218b" />

<img width="775" height="116" alt="image" src="https://github.com/user-attachments/assets/04b80a43-6380-415c-8105-7ee626be3cb8" />

<img width="478" height="27" alt="image" src="https://github.com/user-attachments/assets/33fb901e-0749-4a9e-9e20-078cc800af46" />

<img width="411" height="86" alt="image" src="https://github.com/user-attachments/assets/7ee57aa8-fc36-48f3-8174-5c071c8a5f6c" />

<img width="733" height="109" alt="image" src="https://github.com/user-attachments/assets/9d13ea51-e20d-4321-a2a6-d79c9b32261e" />

<img width="409" height="66" alt="image" src="https://github.com/user-attachments/assets/077ccce2-88fe-40bf-944d-b7d2b6966d15" />

#### Различие между sigterm и sigkill в принудительности уничтожения процесса:

sigterm \- подает сигнал самой программе, она может проигнорировать его(зависла или так настроена), перехватить его, выполнив перед выходом корректное завершение работы.

sigkill \- принудительное уничтожение на уровне ядра ОС. Сигнал передается не программе, а ядру, таким образом, завершая любой процесс, но с угрозой потери данных или их повреждения.

### 8

#### Приостановили:  
<img width="869" height="250" alt="image" src="https://github.com/user-attachments/assets/65d9f4b4-eb04-4069-90cd-3cdc4f3ea353" />

<img width="709" height="92" alt="image" src="https://github.com/user-attachments/assets/d705af62-548e-41e5-81ac-505c776ccd86" />


#### Запустили:  
<img width="831" height="164" alt="image" src="https://github.com/user-attachments/assets/678e35b9-19ef-4967-bc27-2bb112b64a91" />


### 9

<img width="974" height="188" alt="image" src="https://github.com/user-attachments/assets/0ece427f-368a-4ca9-9203-b1be16e09a53" />


### 10

 <img width="442" height="407" alt="image" src="https://github.com/user-attachments/assets/7347dacc-795a-493a-893d-bbdbac700605" />

 <img width="496" height="209" alt="image" src="https://github.com/user-attachments/assets/8a8d1f7b-95fa-4b95-9e73-b477dda46c3d" />



### 11\.

<img width="606" height="114" alt="image" src="https://github.com/user-attachments/assets/e209368c-82c3-408c-b936-33ba3b9b6e39" />

<img width="839" height="342" alt="image" src="https://github.com/user-attachments/assets/c2105db6-c23c-4c4a-8d62-e7719a8872da" />


<img width="838" height="203" alt="image" src="https://github.com/user-attachments/assets/1a0bf658-8525-4384-89ff-e3f0826f1f64" />

<img width="850" height="261" alt="image" src="https://github.com/user-attachments/assets/c57df19f-3e5d-4780-9bc2-07a9f75c57e6" />


### 12\.

#### 1. Когда пользователь выходит из терминала или обрывается ssh-соединение, то системы посылает всем процессам этой сессии сигнал sighup, который по умолчанию завершает программу. Команда nohup запускает скрипт так чтобы он игнорировал сигнал sighup, а также отвязывает его стандартный ввод/вывод от терминала, перенаправляя в nohup.out:  
   <img width="359" height="52" alt="image" src="https://github.com/user-attachments/assets/d2f4501b-a412-4c3b-88aa-a7c04176e0e8" />
 Поэтому после закрытия сессии скрипт продолжает работать. 

#### 2. PPID стал равен 1, потому что при обычном запуске родителем (PPID) скрипта является процесс оболочки bash. Когда мы выходим из сессии (exit) родительский процесс завершается и исчезает, а уже запущенный процесс script32 продолжает работать благодаря nohup. Так как процесса без родителя существовать не может, то автоматически этому процессу назначается родитель с PID 1 \- ядро ОС.

## Часть 6\. Аудит безопасности в скрипте инвентаризации

#### Запуск с правами root:
<img width="747" height="249" alt="image" src="https://github.com/user-attachments/assets/9ebef54b-ff42-445a-8e40-38ddb7064848" />


#### Запуск под пользователем с правами sudo:
<img width="780" height="351" alt="image" src="https://github.com/user-attachments/assets/d44595f0-f1b8-4fa1-ab05-d31c0132c4f1" />


#### Запуск под пользователем без прав (недоступен, код ошибки 1):  
<img width="974" height="115" alt="image" src="https://github.com/user-attachments/assets/6c909b38-3762-4571-b4a6-c03f116851cd" />


#### Базовые проверки:  
<img width="784" height="469" alt="image" src="https://github.com/user-attachments/assets/897a4880-f6d4-475e-a1fb-062e5a791c63" />


## Вопросы и задания

### 1\. Зачем при создании SSH-ключа предлагается задать парольную фразу и от какой угрозы она защищает?
Ключ - это пара файлов: открытый и закрытый ключи. Открытый хранится на сервере, а закрытый - локально на ПК. Доступ на сервер осуществляется проверкой наличия этого закрытого ключа сервером. Так как закртытй ключ - это файл, то его можно украсть. Для того, чтобы его кража была бесполезна и нужна парольная фраза, которая шифрует файл закрытого ключа на диске.

### 2\. Зачем при первом подключении по SSH клиент показывает отпечаток ключа сервера и просит подтвердить его? Что произойдёт, если отпечаток изменится?
Отпечаток нужен для того, чтобы клиент удостоверился что подключается к нужному серверу, сравнивая отпечаток с настоящим. Если отпечаток изменится, то клиент выведет предупрежедение и откажется подключаться. Причины изменения: переустановка сервера, перегенерация ключа, подмена сервера.

### 3\. Если у двух пользователей одинаковые пароли, можно ли понять это по /etc/shadow? Почему?
Нет, нельзя. В /etc/shadow хранятся не пароли в чистом виде а их хэши, причем перед хэшированием к паролю добавляется соль (случайная строка), которая видна в записи хэша. Поэтому одинаковый пароль + разная соль дают разные хэши, и глядя на них нельзя понять были ли пароли одинаковыми. Так сделано, чтобы с помощью таблиц хэшей нельзя было взломать нескольких пользователей разом.

### 4\. Заполните таблицу: атрибут (r, w, x, suid, sgid, sticky bit), сокращённое название, значение для файла, значение для каталога. В таблице должно быть 6 строк.
|r|read (чтение)|можно читать содержимое файла|можно получить список имён внутри (ls)|
|:---|:---|:---|:---|
|r|read|можно читать содержимое файла|можно получить список имён внутри (ls)|
|w|write|можно изменять содержимое файла|можно создавать, удалять и переименовывать записи внутри (только с x)|
|x|execute|можно запустить файл как программу|можно «проходить» через каталог: заходить (cd) и обращаться к файлам по имени|
|suid (4000)|set user ID|программа запускается с правами владельца файла, а не запустившего|не применяется|
|sgid (2000)|set group ID|программа запускается с правами группы-владельца файла|новые файлы внутри наследуют группу каталога|
|sticky bit (1000)|липкий бит|почти не используется|удалять и переименовывать файлы могут только их владелец, владелец каталога и root|

### 5\. Почему для удаления файла нужны права на каталог, а не на файл? Какие изменения вносит установка sticky bit на каталог?
Когда мы удаляем файл в каталоге, файл не удаляется, удаляется запись в каталоге, что данный файл там хранился, т.е. изменяем каталог. Для этого нужны права w(+x) на сам каталог.
Sticky bit меняет правило, на каталоге с ним (chmod +t, 1...) удалять и переименовывать файлы могут только владелец файла, каталога или рут, даже если у остальных есть право на запись в каталог.

### 6\. Приведите команду setfacl, которая даёт конкретному пользователю все права на файл, не делая его владельцем и не добавляя в группы. Как решить с помощью ACL задание 3 из Части 3?
`setfacl -m u:<user>:rwx file.txt`. ACL - доп. список прав, прикрепленный к файлу, где прописываются права конкретного пользователя или группы, не меняя владельца и группы файла.
Задание 3.3:
```
mkdir -p /DATA/sec2
chown u1:u1 /DATA/sec2 # владелец u1
chmod 700 /DATA/sec2 # базово только владелец, остальным ничего
setfacl -m u:u4:r-x /DATA/sec2 # u4 может смотреть список и заходить, но не создавать
setfacl -m u:u5:r-x /DATA/sec2 # u5 как и u4
setfacl -d -m u:u4:r-x /DATA/sec2 # то же для файлов, которые появятся позже (-d - новым по дефолту)
setfacl -d -m u:u5:r-x /DATA/sec2
```
То есть первоначально выдаем полные права и делмае владельцем u1, для остальных все запрещаем. А далее отдельно расписываем права доступа для u4 и u5.

### 7\. Чем различаются su, su \- и sudo? Почему в Debian для повседневной работы рекомендуют sudo, а не пароль root?
`su` - переключение на другого пользователя (по умлочанию root). Спрашивает пароль целевого пользователя. При этом часть текущего окружения сохраняется.
`su -` - как и `su`, но полноценный вход, с заменой окружения как у целевого пользователя, если бы он залогинился.
`sudo` - выполняет одну команду от имени другого пользвателя. Спрашивает собственный пароль, а не целевого пользователя.

Почему рекомендуют sudo:
* 1. пароль root не сообщается, т.к. используется свой
  2. каждое применение sudo записывается в журнал
  3. права можно настроить точечно (принцип наименьших привилегий)
  4. права легко отозвать (убрать из группы sudo), не меняя пароль рута.

### 8\. Удалось ли вам обойти ограничение sudo из Части 5, Блок А? Почему правила с подстановочными знаками в sudoers считаются опасными?
Ограничение обойти не удалось:
`sudo passwd u2` - работает
`sudo passwd root` - отказ (работает исключение с !)
`sudo ls /root` - отказ
`sudo passwd` - отказ

Правила с подстановочными знаками считаются опасными, потому что если не указывать никаких аргументов, а исключение написано только под root, то команда пройдет. Так как по умолчанию passwd без аргументов меняет пароль root, то такую защиту можно легко обойти.
В моей конфигурации обход не сработал, так как правило написано так, что отказывает вызову без аргументов. 

Правила с подстановочными знаками (*) опасны, так как сравниваются строки, а не смысл команд. Так, если неправильно указать путь файла или другое правило, то можно получить дыру.


### 9\. Чем отличается SIGTERM от SIGKILL? Какой из них процесс может перехватить?
* SIGTERM (15) - мягкая просьба завершиться. Процесс может перехватить этот сигнал,
  сохранить данные, закрыть файлы и аккуратно завершиться. Этот сигнал по умолнаю у kill
  
* SIDKILL (9) - принудительное завершение. Сигнал обрабатывает ядро, процесс не может
  его перехватить, проигнорировать или обработать. Нужен когда процесс не реагирует на
  SIGTERM.

### 10\. Что происходит с процессом, запущенным через &, при закрытии SSH-сессии, и почему nohup меняет это поведение? Почему у процесса с nohup PPID после этого стал другим?
При закрытии ssh сессии закрывается управляющий терминал и всем процессам, привязанным к нему, ядро посылает SIGHUP (сигнал об отбое). Процесс запущенный через & к терминалу привязан, поэтому завершается.

nohup заставляет команду игнорировать SIGHUP, поэтому процесс переживает закрытие сессии (а вывод пишется в nohup.out)

PPID меняется, потому что пока сессия жива, родитель процесса - оболочка bash. После закрытия сессии bash завершается и процесс становится без родителя (орфаном). Система не может позволить существовать процессам без родителя, поэтому становится им сама, давая PPID = 1 (так как ее PID = 1).

### 11\. Что такое зомби-процесс? Можно ли его убить командой kill \-9 и почему?
Зомби - процесс который уже завершился, но его код возврата не прочитан родителем. От процесса ничего не осталось, кроме строки в таблице процессов (PID + код возврата), которую должен прочитать родитель.

Убить зомби kill -9  нельзя, так как он уже мертв и сигналы никуда не доставятся. Избавиться от такого процесса можно либо тогда, когда родитель прочитает код возврата, либо если родительский процесс завис, то убить его, сделав родителем зомби-процесса систему, которая уже прочитает код возврата и убирает его.

### 12\. Чем отличается вывод sshd \-T от строк, найденных в sshd\_config через grep? Приведите пример параметра, у которого они различаются.
* `sshd -T` показывает эффективные значения - те, которые сервер будет использовать: он читает основной файл `/etc/ssh/sshd_config`, затем вложенные файлы из `/etc/ssh/sshd_config.d/` и для непрописанных параметров проставляет значение по умолчанию. Выводит все параметры, строчными буквами.

* `grep` по `sshd_config` показывает только строки явно написанные в этом одном файле, без вложенных файлов и без умолчаний.

Пример расхождения: в основном файле строки параметр `Port` может вообще не быть, а sshd -T выведет port 22 - значение по умолчанию. Обратный пример: мы прописали MaxAuthTries 2 в основном файле, но если тот же параметр задан раньше во вложенном файле каталога sshd_config.d/, то побеит вложенное значение и grep покажет 2 по основному файлу, а sshd -T -  другое число. Также различие регистра: в конфиге - `PermitRootLogin`, в выводе `sshd -T` - `permitrootlogin`.

### 13\. Какой риск возникает, если владельцем исполняемого файла будет root и на этот файл будет установлен suid?
suid заставляет программу выполнятся с правами владельца файла, если владелец - root, то любой пользователь запустивший файл получает права рута внутри программы.

Риск в том, что если в программе есть ошибка или она умеет делать что-либо с редактором, оболочкой, копированием файлов, то ее можно использовать для доступа к запрещенным вещам. Пример из работы: копия nano в suid root в /DATA/sec3 - любой пользователь может открыть в этом nano любой файл системы, например /etc/shadow или etc/sudoers и изменить его с правами root, получив контроль над системой. Поэтому такие файлы аудируют командой `find /usr/bin /usr/sbin -perm -4000`.
