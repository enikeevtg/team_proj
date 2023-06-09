# team_project
Team work training: new branches, parallel coding, pulls, merges.

***

## Content
* [Helpful Links](#helpful-links)
* [Про ветвление в Git](#про-ветвление-в-git)

***

## Helpful Links

[Хабр: Введение в Bash Shell](https://habr.com/ru/articles/471242/)

[Переименование файлов с помощью find, sed и xargs](https://lisakov.com/blog/renaming-find-sed-xargs-mv/#xargs-1)

[Использование SED. Полезные команды SED](https://kamaok.org.ua/?p=2424)

[Pro Git book (by Scott Chacon and Ben Straub)](https://git-scm.com/book/en/v2)

[Git: курс от JavaScript.ru на YouTube](https://www.youtube.com/playlist?list=PLDyvV36pndZFHXjXuwA_NywNrVQO0aQqb)

[Хабр: Git Rebase: руководство по использованию](https://habr.com/ru/articles/161009/)

***

## Про ветвление в Git

* Materials from
["Git Branching"](https://git-scm.com/book/en/v2/Git-Branching-Branches-in-a-Nutshell)

* Материалы с
["Ветвление в Git"](https://git-scm.com/book/ru/v2/%D0%92%D0%B5%D1%82%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5-%D0%B2-Git-%D0%9E-%D0%B2%D0%B5%D1%82%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B8-%D0%B2-%D0%B4%D0%B2%D1%83%D1%85-%D1%81%D0%BB%D0%BE%D0%B2%D0%B0%D1%85)   

__Содержание__

1. [Введение](#введение)\
    1.1 [Создание новой ветки: _git branch_](#создание-новой-ветки)  
    1.2 [Переключение веток: _git checkout_](#переключение-веток)
2. [Ветвление в Git](#основы-ветвления-и-слияния) \
    2.1 [Ветвление в Git: _git branch/checkout_](#основы-ветвления-и-слияния)  
    2.2 [Основы слияния: _git merge_](#основы-слияния)  
    2.3 [Основные конфликты слияния (external)](https://git-scm.com/book/ru/v2/%D0%92%D0%B5%D1%82%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5-%D0%B2-Git-%D0%9E%D1%81%D0%BD%D0%BE%D0%B2%D1%8B-%D0%B2%D0%B5%D1%82%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D1%8F-%D0%B8-%D1%81%D0%BB%D0%B8%D1%8F%D0%BD%D0%B8%D1%8F#:~:text=%D0%9E%D1%81%D0%BD%D0%BE%D0%B2%D0%BD%D1%8B%D0%B5%20%D0%BA%D0%BE%D0%BD%D1%84%D0%BB%D0%B8%D0%BA%D1%82%D1%8B%20%D1%81%D0%BB%D0%B8%D1%8F%D0%BD%D0%B8%D1%8F)
3. [Управление ветками](#управление-ветками) \
    3.1 [Управление ветками: _git branch -v_](#управление-ветками)  
    3.2 [Переименование ветки: _git branch --move_](#переименование-ветки)
4. [Работа с ветками (external)](https://git-scm.com/book/ru/v2/%D0%92%D0%B5%D1%82%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5-%D0%B2-Git-%D0%A0%D0%B0%D0%B1%D0%BE%D1%82%D0%B0-%D1%81-%D0%B2%D0%B5%D1%82%D0%BA%D0%B0%D0%BC%D0%B8)
5. [Удалённые ветки](#удалённые-ветки) \
    5.1 [Отправка изменений: _git push <remote> <branch>_](#отправка-изменений)  
    5.2 [Отслеживание веток: _git checkout -b <branch> <remote>/<branch>_](#отслеживание-веток)  
    5.3 [Получение изменений: _git fetch_](#получение-изменений)  
    5.4 [Удаление веток на удалённом сервере: _git push origin --delete_](#удаление-веток-на-удалённом-сервере)
6. [Перебазирование (external)](https://git-scm.com/book/ru/v2/%D0%92%D0%B5%D1%82%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5-%D0%B2-Git-%D0%9F%D0%B5%D1%80%D0%B5%D0%B1%D0%B0%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5)

***
## Введение
[Источник](https://git-scm.com/book/ru/v2/%D0%92%D0%B5%D1%82%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5-%D0%B2-Git-%D0%9E-%D0%B2%D0%B5%D1%82%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B8-%D0%B2-%D0%B4%D0%B2%D1%83%D1%85-%D1%81%D0%BB%D0%BE%D0%B2%D0%B0%D1%85)

Ветка в Git — это простой перемещаемый указатель на один из таких коммитов. По умолчанию, имя основной ветки в Git — master. Как только вы начнёте создавать коммиты, ветка master будет всегда указывать на последний коммит. Каждый раз при создании коммита указатель ветки master будет передвигаться на следующий коммит автоматически.

Ветка в Git — это простой файл, содержащий 40 символов контрольной суммы `SHA-1` коммита, на который она указывает; поэтому операции с ветками являются дешёвыми с точки зрения потребления ресурсов или времени. Создание новой ветки в Git происходит так же быстро и просто как запись 41 байта в файл (40 знаков и перевод строки).

***
### Создание новой ветки
***

Что же на самом деле происходит при создании ветки? Всего лишь создаётся новый указатель для дальнейшего перемещения. Допустим вы хотите создать новую ветку с именем testing. Вы можете это сделать командой `git branch`:

    $ git branch testing

В результате создаётся новый указатель на текущий коммит.

***
### Переключение веток
***

Для переключения на существующую ветку выполните команду `git checkout`. Давайте переключимся на ветку `testing`:

    $ git checkout testing

В результате указатель `HEAD` переместится на ветку `testing`.

***
### История коммитов
***

Для отображения истории коммитов, текущего положения указателей веток и истории ветвления выполните команду `git log --oneline --decorate --graph --all`.

    $ git log --oneline --decorate --graph --all
    * c2b9e (HEAD, master) Made other changes
    | * 87ab2 (testing) Made a change
    |/
    * f30ab Add feature #32 - ability to add new formats to the central interface
    * 34ac2 Fix bug #1328 - stack overflow under certain conditions
    * 98ca9 initial commit of my project

Чтобы создать ветку и сразу переключиться на неё, можно выполнить команду `git checkout` с параметром `-b`:

    $ git checkout -b iss53
    Switched to a new branch "iss53"

Это то же самое что и:

    $ git branch iss53
    $ git checkout iss53

***
## Основы ветвления и слияния
[Источник](https://git-scm.com/book/ru/v2/%D0%92%D0%B5%D1%82%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5-%D0%B2-Git-%D0%9E%D1%81%D0%BD%D0%BE%D0%B2%D1%8B-%D0%B2%D0%B5%D1%82%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D1%8F-%D0%B8-%D1%81%D0%BB%D0%B8%D1%8F%D0%BD%D0%B8%D1%8F)

Создание ветки `iss53` как ответвление от ветки `master`, работа в `iss53` и коммит:

    $ git checkout -b iss53
    Switched to a new branch "iss53"
    $ git branch iss53
    $ git checkout iss53
    $ vim index.html
    $ git commit -a -m 'Create new footer [issue 53]'

Создание ветки `hotfix` как ответвление от ветки `master`, работа в `hotfix` и коммит:

    $ git checkout master
    Switched to branch 'master'
    $ git checkout -b hotfix
    Switched to a new branch 'hotfix'
    $ vim index.html
    $ git commit -a -m 'Fix broken email address'
    [hotfix 1fb7853] Fix broken email address
    1 file changed, 2 insertions(+)

Слияние веток `master` и `hotfix` (перемещение указателя `master` на коммит, на который указывает `hotfix`)

    $ git checkout master
    $ git merge hotfix
    Updating f42c576..3a0874c
    Fast-forward
    index.html | 2 ++
    1 file changed, 2 insertions(+)

Git просто переместил указатель ветки вперед, потому что коммит, на который указывает слитая ветка `hotfix`, был прямым потомком коммита, на котором вы находились до этого. Другими словами, если коммит сливается с тем, до которого можно добраться двигаясь по истории прямо, Git упрощает слияние просто перенося указатель ветки вперед, так как нет расхождений в изменениях. Это называется `«fast-forward»`.

После внедрения вашего архиважного исправления, вы готовы вернуться к работе над тем, что были вынуждены отложить. Но сначала нужно удалить ветку `hotfix`, потому что она больше не нужна — ветка `master` указывает на то же самое место. Для удаления ветки выполните команду `git branch` с параметром `-d`:

    $ git branch -d hotfix
    Deleted branch hotfix (3a0874c).

Теперь вы можете переключиться обратно на ветку `iss53` и продолжить работу над проблемой #53:

    $ git checkout iss53
    Switched to branch "iss53"
    $ vim index.html
    $ git commit -a -m 'Finish the new footer [issue 53]'
    [iss53 ad82d7a] Finish the new footer [issue 53]
    1 file changed, 1 insertion(+)

Стоит обратить внимание на то, что все изменения из ветки `hotfix` не включены в вашу ветку `iss53`. Если их нужно включить, вы можете влить ветку `master` в вашу ветку `iss53` командой `git merge master`, или же вы можете отложить слияние этих изменений до завершения работы, и затем влить ветку `iss53` в `master`.

***
### Основы слияния
***

Предположим, вы решили, что работа по проблеме #53 закончена и её можно влить в ветку `master`. Для этого нужно выполнить слияние ветки `iss53` точно так же, как вы делали это с веткой `hotfix` ранее. Все, что нужно сделать — переключиться на ветку, в которую вы хотите включить изменения, и выполнить команду `git merge`:

    $ git checkout master
    Switched to branch 'master'
    $ git merge iss53
    Merge made by the 'recursive' strategy.
    index.html |    1 +
    1 file changed, 1 insertion(+)

Результат этой операции отличается от результата слияния ветки `hotfix`. В данном случае процесс разработки ответвился в более ранней точке. Так как коммит, на котором мы находимся, не является прямым родителем ветки, с которой мы выполняем слияние, Git придётся немного потрудиться. В этом случае Git выполняет простое трёхстороннее слияние, используя последние коммиты объединяемых веток и общего для них родительского коммита.

Вместо того, чтобы просто передвинуть указатель ветки вперёд, Git создаёт новый результирующий снимок трёхстороннего слияния, а затем автоматически делает коммит. Этот особый коммит называют коммитом слияния, так как у него более одного предка.

Теперь, когда изменения слиты, ветка `iss53` больше не нужна. Вы можете закрыть задачу в системе отслеживания ошибок и удалить ветку:

    $ git branch -d iss53

***
### [Основные конфликты слияния](https://git-scm.com/book/ru/v2/%D0%92%D0%B5%D1%82%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5-%D0%B2-Git-%D0%9E%D1%81%D0%BD%D0%BE%D0%B2%D1%8B-%D0%B2%D0%B5%D1%82%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D1%8F-%D0%B8-%D1%81%D0%BB%D0%B8%D1%8F%D0%BD%D0%B8%D1%8F#:~:text=%D0%9E%D1%81%D0%BD%D0%BE%D0%B2%D0%BD%D1%8B%D0%B5%20%D0%BA%D0%BE%D0%BD%D1%84%D0%BB%D0%B8%D0%BA%D1%82%D1%8B%20%D1%81%D0%BB%D0%B8%D1%8F%D0%BD%D0%B8%D1%8F)

***
## Управление ветками
[Источник](https://git-scm.com/book/ru/v2/%D0%92%D0%B5%D1%82%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5-%D0%B2-Git-%D0%9E%D1%81%D0%BD%D0%BE%D0%B2%D1%8B-%D0%B2%D0%B5%D1%82%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D1%8F-%D0%B8-%D1%81%D0%BB%D0%B8%D1%8F%D0%BD%D0%B8%D1%8F)

Команда `git branch` делает несколько больше, чем просто создаёт и удаляет ветки. При запуске без параметров, вы получите простой список имеющихся у вас веток:

    $ git branch
      iss53
    * master
      testing

Символ *, стоящий перед веткой `master` указывает на ветку, на которой вы находитесь в настоящий момент (т. е. ветку, на которую указывает `HEAD`). Это означает, что если вы сейчас сделаете коммит, ветка `master` переместится вперёд в соответствии с вашими последними изменениями. Чтобы посмотреть последний коммит на каждой из веток, выполните команду `git branch -v`:

    $ git branch -v
      iss53   93b412c Fix javascript issue
    * master  7a98805 Merge branch 'iss53'
      testing 782fd34 Add scott to the author list in the readme

Опции `--merged` и `--no-merged` могут отфильтровать этот список для вывода только тех веток, которые слиты или ещё не слиты в текущую ветку. Чтобы посмотреть те ветки, которые вы уже слили с текущей, можете выполнить команду `git branch --merged`:

    $ git branch --merged
      iss53
    * master

Ветка `iss53` присутствует в этом списке потому что вы ранее слили её в `master`. Те ветки из этого списка, перед которыми нет символа `*`, можно смело удалять командой `git branch -d`; наработки из этих веток уже включены в другую ветку, так что ничего не потеряется.

Чтобы увидеть все ветки, содержащие наработки, которые вы пока ещё не слили в текущую ветку, выполните команду `git branch --no-merged`:

    $ git branch --no-merged
      testing

Вы увидите оставшуюся ветку. Так как она содержит ещё не слитые наработки, попытка удалить её командой `git branch -d` приведёт к ошибке:

    $ git branch -d testing
    error: The branch 'testing' is not fully merged.
    If you are sure you want to delete it, run 'git branch -D testing'.

Если вы действительно хотите удалить ветку вместе со всеми наработками, используйте опцию `-D`, как указано в подсказке.

***
### Переименование ветки
***

Предположим, у вас есть ветка с именем `bad-branch-name`, и вы хотите изменить её на `corrected-branch-name`, сохранив при этом всю историю. Вместе с этим, вы также хотите изменить имя ветки на удалённом сервере (GitHub, GitLab или другой сервер). Как это сделать?

Переименуйте ветку локально с помощью команды `git branch --move`:

    $ git branch --move bad-branch-name corrected-branch-name

Ветка `bad-branch-name` будет переименована в `corrected-branch-name`, но это изменение пока только локальное. Чтобы все остальные увидели исправленную ветку в удалённом репозитории, отправьте её туда:

    $ git push --set-upstream origin corrected-branch-name

Теперь проверим, где мы сейчас находимся:

    $ git branch --all
    * corrected-branch-name
      main
      remotes/origin/bad-branch-name
      remotes/origin/corrected-branch-name
      remotes/origin/main

Обратите внимание, что текущая ветка `corrected-branch-name`, которая также присутствует и на удалённом сервере. Однако, старая ветка всё ещё по-прежнему там, но её можно удалить с помощью команды:

    $ git push origin --delete bad-branch-name

Теперь старое имя ветки полностью заменено исправленным.

***
## [Работа с ветками](https://git-scm.com/book/ru/v2/%D0%92%D0%B5%D1%82%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5-%D0%B2-Git-%D0%A0%D0%B0%D0%B1%D0%BE%D1%82%D0%B0-%D1%81-%D0%B2%D0%B5%D1%82%D0%BA%D0%B0%D0%BC%D0%B8)

***
## Удалённые ветки
[Источник](https://git-scm.com/book/ru/v2/%D0%92%D0%B5%D1%82%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5-%D0%B2-Git-%D0%A0%D0%B0%D0%B1%D0%BE%D1%82%D0%B0-%D1%81-%D0%B2%D0%B5%D1%82%D0%BA%D0%B0%D0%BC%D0%B8)

Удалённые ссылки — это ссылки (указатели) в ваших удалённых репозиториях, включая ветки, теги и так далее. Полный список удалённых ссылок можно получить с помощью команды `git ls-remote <remote>` или команды `git remote show <remote>` для получения удалённых веток и дополнительной информации. Тем не менее, более распространённым способом является использование веток слежения.

Ветки слежения — это ссылки на определённое состояние удалённых веток. Это локальные ветки, которые нельзя перемещать; Git перемещает их автоматически при любой коммуникации с удалённым репозиторием, чтобы гарантировать точное соответствие с ним. Представляйте их как закладки для напоминания о том, где ветки в удалённых репозиториях находились во время последнего подключения к ним.

Имена веток слежения имеют вид `<remote>/<branch>`. Например, если вы хотите посмотреть, как выглядела ветка master на сервере origin во время последнего соединения с ним, используйте ветку `origin/master`. Если вы с коллегой работали над одной задачей и он отправил на сервер ветку `iss53`, при том что у вас может быть своя локальная ветка `iss53`, удалённая ветка будет представлена веткой слежения с именем `origin/iss53`.

Для синхронизации ваших изменений с удалённым сервером выполните команду `git fetch <remote>` (`git fetch origin`). Эта команда определяет какому серверу соответствует `«origin»`, извлекает оттуда данные, которых у вас ещё нет, и обновляет локальную базу данных, сдвигая указатель `origin/master` на новую позицию.

***
### Отправка изменений
***

Когда вы хотите поделиться веткой, вам необходимо отправить её на удалённый сервер, где у вас есть права на запись. Ваши локальные ветки автоматически не синхронизируются с удалёнными при отправке — вам нужно явно указать те ветки, которые вы хотите отправить. Таким образом, вы можете использовать свои личные ветки для работы, которую не хотите показывать, а отправлять только те тематические ветки, над которыми вы хотите работать с кем-то совместно.

Если у вас есть ветка `serverfix`, над которой вы хотите работать с кем-то ещё, вы можете отправить её точно так же, как вы отправляли вашу первую ветку. Выполните команду `git push <remote> <branch>`:

    $ git push origin serverfix
    Counting objects: 24, done.
    Delta compression using up to 8 threads.
    Compressing objects: 100% (15/15), done.
    Writing objects: 100% (24/24), 1.91 KiB | 0 bytes/s, done.
    Total 24 (delta 2), reused 0 (delta 0)
    To https://github.com/schacon/simplegit
    * [new branch]      serverfix -> serverfix

Это в некотором роде сокращение. Git автоматически разворачивает имя ветки `serverfix` до `refs/heads/serverfix:refs/heads/serverfix`, что означает «возьми мою локальную ветку `serverfix` и обнови ей удалённую ветку `serverfix`». Вы также можете выполнить `git push origin serverfix:serverfix` — произойдёт то же самое — здесь говорится «возьми мою ветку `serverfix` и сделай её удалённой веткой `serverfix`». Можно использовать этот формат для отправки локальной ветки в удалённую ветку с другим именем. Если вы не хотите, чтобы на удалённом сервере ветка называлась serverfix, то вместо предыдущей команды выполните `git push origin serverfix:awesomebranch`, которая отправит локальную ветку `serverfix` в ветку awesomebranch удалённого репозитория.

В следующий раз, когда один из ваших соавторов будет получать обновления с сервера, он получит ссылку на то, на что указывает `serverfix` на сервере, как удалённую ветку `origin/serverfix`:

    $ git fetch origin
    remote: Counting objects: 7, done.
    remote: Compressing objects: 100% (2/2), done.
    remote: Total 3 (delta 0), reused 3 (delta 0)
    Unpacking objects: 100% (3/3), done.
    From https://github.com/schacon/simplegit
    * [new branch]      serverfix    -> origin/serverfix

Необходимо отметить, что при получении данных создаются ветки слежения, вы не получаете автоматически для них локальных редактируемых копий. Другими словами, в нашем случае вы не получите новую ветку `serverfix` — только указатель `origin/serverfix`, который вы не можете изменять.

Чтобы слить эти наработки в свою текущую рабочую ветку, выполните git merge `origin/serverfix`. Если вам нужна локальная ветка `serverfix`, в которой вы сможете работать, то вы можете создать её на основе ветки слежения:

    $ git checkout -b serverfix origin/serverfix
    Branch serverfix set up to track remote branch serverfix from origin.
    Switched to a new branch 'serverfix'

Это даст вам локальную ветку, в которой можно работать и которая будет начинаться там же, где и `origin/serverfix`.

***
## Отслеживание веток
[Источник](https://git-scm.com/book/ru/v2/%D0%92%D0%B5%D1%82%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5-%D0%B2-Git-%D0%A3%D0%B4%D0%B0%D0%BB%D1%91%D0%BD%D0%BD%D1%8B%D0%B5-%D0%B2%D0%B5%D1%82%D0%BA%D0%B8)
***

Получение локальной ветки из удалённой ветки автоматически создаёт то, что называется «веткой слежения» (а ветка, за которой следит локальная называется «`upstream branch`»). Ветки слежения — это локальные ветки, которые напрямую связаны с удалённой веткой. Если, находясь на ветке слежения, выполнить `git pull`, то Git уже будет знать с какого сервера получать данные и какую ветку использовать для слияния.

При клонировании репозитория, как правило, автоматически создаётся ветка master, которая следит за `origin/master`. Однако, при желании вы можете настроить отслеживание и других веток — следить за ветками на других серверах или отключить слежение за веткой master. Вы только что видели простейший пример, что сделать это можно с помощью команды `git checkout -b <branch> <remote>/<branch>`. Это часто используемая команда, поэтому Git предоставляет сокращённую форму записи в виде флага `--track`:

    $ git checkout --track origin/serverfix
    Branch serverfix set up to track remote branch serverfix from origin.
    Switched to a new branch 'serverfix'

В действительности, это настолько распространённая команда, что существует сокращение для этого сокращения. Если вы пытаетесь извлечь ветку, которая не существует, но существует только одна удалённая ветка с точно таким же именем, то Git автоматически создаст ветку слежения:

    $ git checkout serverfix
    Branch serverfix set up to track remote branch serverfix from origin.
    Switched to a new branch 'serverfix'

Чтобы создать локальную ветку с именем, отличным от имени удалённой ветки, просто укажите другое имя:

    $ git checkout -b sf origin/serverfix
    Branch sf set up to track remote branch serverfix from origin.
    Switched to a new branch 'sf'

Теперь ваша локальная ветка `sf` будет автоматически получать изменения из `origin/serverfix`.

Если у вас уже есть локальная ветка и вы хотите настроить её на слежение за удалённой веткой, которую вы только что получили, или хотите изменить используемую upstream-ветку, то воспользуйтесь параметрами `-u` или `--set-upstream-to` для команды `git branch`, чтобы явно установить новое значение.

    $ git branch -u origin/serverfix
    Branch serverfix set up to track remote branch serverfix from origin.

Если вы хотите посмотреть как у вас настроены ветки слежения, воспользуйтесь опцией `-vv` для команды `git branch`. Это выведет список локальных веток и дополнительную информацию о том, какая из веток отслеживается, отстаёт, опережает или всё сразу относительно отслеживаемой.

    $ git branch -vv
      iss53     7e424c3 [origin/iss53: ahead 2] Add forgotten brackets
      master    1ae2a45 [origin/master] Deploy index fix
    * serverfix f8674d9 [teamone/server-fix-good: ahead 3, behind 1] This should do it
      testing   5ea463a Try something new

Итак, здесь мы видим, что наша ветка `iss53` следит за `origin/iss53` и «опережает» её на два изменения — это значит, что у нас есть два локальных коммита, которые не отправлены на сервер. Мы также видим, что наша ветка master отслеживает ветку `origin/master` и находится в актуальном состоянии. Далее мы можем видеть, что локальная ветка `serverfix` следит за веткой `server-fix-good` на сервере teamone, опережает её на три коммита и отстает на один — это значит, что на сервере есть один коммит, который мы ещё не слили, и три локальных коммита, которые ещё не отправлены на сервер. В конце мы видим, что наша ветка `testing` не отслеживает удалённую ветку.

Важно отметить, что эти цифры описывают состояние на момент последнего получения данных с каждого из серверов. Эта команда не обращается к серверам, а лишь говорит вам о том, какая информация с этих серверов сохранена в локальном кэше. Если вы хотите иметь актуальную информацию об этих числах, вам необходимо получить данные со всех ваших удалённых серверов перед запуском команды. Сделать это можно вот так:

    $ git fetch --all; git branch -vv

***
### Получение изменений
***
Команда `git fetch` получает с сервера все изменения, которых у вас ещё нет, но не будет изменять состояние вашей рабочей копии. Эта команда просто получает данные и позволяет вам самостоятельно сделать слияние. Тем не менее, существует команда `git pull`, которая в большинстве случаев является командой `git fetch`, за которой непосредственно следует команда `git merge`. Если у вас настроена ветка слежения как показано в предыдущем разделе, или она явно установлена, или она была создана автоматически командами `clone` или `checkout`, `git pull` определит сервер и ветку, за которыми следит ваша текущая ветка, получит данные с этого сервера и затем попытается слить удалённую ветку.

Обычно, лучше явно использовать команды `fetch` и `merge`, поскольку магия `git pull` может часто сбивать с толку.

***
### Удаление веток на удалённом сервере
***

Скажем, вы и ваши соавторы закончили с нововведением и слили его в ветку master на удалённом сервере (или в какую-то другую ветку, где хранится стабильный код). Вы можете удалить ветку на удалённом сервере используя параметр `--delete` для команды `git push`. Для удаления ветки serverfix на сервере, выполните следующую команду:

    $ git push origin --delete serverfix
    To https://github.com/schacon/simplegit
    - [deleted]         serverfix

Всё, что делает эта строка — удаляет указатель на сервере. Как правило, Git сервер хранит данные пока не запустится сборщик мусора, поэтому если ветка была удалена случайно, чаще всего её легко восстановить.

***
## [Перебазирование](https://git-scm.com/book/ru/v2/%D0%92%D0%B5%D1%82%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5-%D0%B2-Git-%D0%9F%D0%B5%D1%80%D0%B5%D0%B1%D0%B0%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5)
***
