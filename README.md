# **GeekHub X | RoR | Homework 7**

![site_screen](https://user-images.githubusercontent.com/23439223/102497685-9f26a180-4081-11eb-8efe-c95cf45868bf.png)

## Description
This project was created to practice ruby.

## Assigned task

Нужно сгенерировать рельсовый проект и сгенерировать сущность Posts используя скафолд.
Установить бутстрап гем, использовать его для вьюх (добавить вёрстку во вьюхах).

## Steps

1) Настроить RubyMine (или удобный для вас редактор)
2) Установить RoR 6.1 (gem install rails)
3) Убедиться что установлена нужная версия рельс (rails -v)
4) Сгенерировать рельсовый проект (rails new project_name)
5) Сгенерировать сущности Post используя скафолд и затем прогнать миграцию
    - rails generate scaffold Post name:string title:string content:text image:string
    - rake db:migrate
6) Запустить проект (убедиться что всё работает)
7) Установить бутстрап
8) Применить вёрстку используя бутстрап
9) Использовать обязательно RVM или rbenv
10) Настроить свою IDE или Text Editor согласно Ruby style code (два пробела, а не таб и т.д.)
11) сделать страницу постов (index) корневой страницей проекта
12) добавить валидацию (проверку наличия данных, максимального размера для title) полей поста (title, content)
13) создать модель Author (только модель (rails g model), таблица будет заполняться с помощью seed, создать 5 авторов)
14) Поля автора: first_name, last_name, gender, birthday (сгенерировать данные с помощью гема faker, тип полей в соответсвии с назначением (string, datetime))
15) при создании или редактировании поста - автора мы должны выбирать с помощью выпадающего списка.
16) Поле image – url. Выводить на странице поста между title и description через хелпер/метод image_tag.
17) Залить на Хероку.

## Literature

- https://rubygems.org/gems/rails
- https://www.xyzpub.com/en/ruby-on-rails/3.2/seed_rb.html
- https://guides.rubyonrails.org/command_line.html
- https://www.jetbrains.com/help/ruby/ruby-gemsets.html
- https://getbootstrap.com/docs/4.3/getting-started/download/#rubygems
- https://github.com/twbs/bootstrap-rubygem/blob/master/README.md
- https://guides.rubyonrails.org/action_view_overview.html
- https://guides.rubyonrails.org/layouts_and_rendering.html

### Additional literature
- https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller
- https://guides.rubyonrails.org/routing.html
- https://guides.rubyonrails.org/active_record_validations.html

### Additional links
- https://mattbrictson.com/sublime-text-3-recommendations - хорошая статья по настройке Sublime Text 3
- https://www.marksayson.com/blog/setting-up-sublime-text-editor-for-ruby-on-rails/ - еще одна

# **GeekHub X | RoR | Homework 8**

![site_screen](https://user-images.githubusercontent.com/23439223/102992569-1e095780-4524-11eb-9c8c-96576873faa7.png)

## Assigned task

Используя ваш текущий проект (блог) расширить его.

## Steps

1) Добавить сущность Comment
2) Добавить миграцию в БД для связи таблиц posts и comments
3) Добавить связь в моделях comment belongs_to post, post has_many comments
4) Комментарий должен иметь поля:
   - body (type: text)
   - status (type: integer) использовать enum
   - поле status может иметь значения [published, unpublished]
   - user_id
   - post_id
5) Добавить возможность создавать комментарий, комментарий должен принадлежать пользователю и посту (не должно быть возможности создавать комментарий которые не будет привязан к одной из сущностей (user, post))
6) По умолчанию когда мы заходим на страницу поста, мы должны видеть только опубликованные коментарии, для этого используйте scope (:published) отсеивая только опубликованные комментарии с помощью выборки
7) Добавить селект бокс с помощью которого мы сможем иметь возможность отображать либо опубликованные либо не опубликованные комментарии (или/или), для выборки не обуликованных комментарии тоже нужно использовать scope (:unpublished)
8) При сохранении комментария, мы должны проверять что комментарий не пустой (есть значение в поле body), что он принадлежит и пользователю (которого мы выбрали) и посту в котором мы его создаём (коммент должен создаваться на странице поста), при создании по умолчанию комментарий должен быть не опубликован
9) На старнице блога мы должны иметь возможность выбрать отображение не опубликованных комментариев и возле каждого из коментариев должна быть кнопка опубликовать (publish) которая будет обновлять поле status и менять его значение на published. Ajax пока для этого использовать не обязательно, по-этому можно перезагружать страницу (редиректить на пост на котором вы были).
10) Добавить хелпер distance_of_time_in_words для отображения на странице даты обновления (updated_at) поля постов и комментариев
11) Добавить counter_cache для постов и выводить результат на списке постов (показывать кол-во просмотров поста)


## Literature

- https://api.rubyonrails.org/v5.2.4.4/classes/ActiveRecord/Enum.html
- https://apidock.com/rails/ActionView/Helpers/DateHelper/distance_of_time_in_words
- https://guides.rubyonrails.org/association_basics.html
- https://blog.appsignal.com/2018/06/19/activerecords-counter-cache.html
- https://guides.rubyonrails.org/active_record_callbacks.html

# **GeekHub X | RoR | Homework 9**

![site_screen](https://user-images.githubusercontent.com/23439223/103435429-209c3900-4c17-11eb-8735-9b4c6e1ff406.png)

## Assigned task

Используя ваш текущий проект (блог) расширить его.

## Steps

1. Сделать систему авторизации для Author.
   Сделать возможность регистрации, входа и выхода (готовые гемы не использовать).
   К предыдущим полям добавляем email и password. Использовать валидацию формата email(через REGEXP) и его уникальности и пароля – не менее 8 символов, должен содержать маленькую латинскую букву, большую, цифру и спец символ.
2. Авторизованный автор может создавать посты.
   Не авторизованный пользователь может только просматривать статьи и комментарии к ним.
   Автор может редактировать только свои посты.
3. Проапдейтить модель комментариев. Оставлять комментарий может только авторизированный пользователь (поле для ввода комментария отсутствует, вывести заметочку - только зарегистрированные пользователи могут оставлять комментарии)
   Автор может редактировать только свои комментарии и только такие, от создания которых не прошло более часа.
4. Отредактированные комментарии помечать словом (edited). Edited должно выделяться.
5. Если пользователь не авторизован, спустя 5 переходов по сайту с помощью всплывающего модульного окна предлагать войти или авторизоваться. Реализовать через куки и after_filter
6. Реализовать поиск по постам (простой, через LIKE / ILIKE). Выдавать посты, где фраза есть в тексте поста и/или в тайтле.
7. Сделать Блог более красивым :) Подумать о UX/UI.
8. Сделать простеньку страничку для профиля автора где только он сможет сменить себе Имя Фамилию. Ограничить возможность редактирования данных другого автора через изменения ссылки в браузере.
9. Сделать возможность устанавливать и изменять аватарку автора через страничку профиля.
10. Сделать вывод аватарки пользователя на странице с постом
11. Если позволяет UI сделать вывод маленькой аватарочки авторизованного пользователя в его комментарии
12. Сделать возможность добавления картинок для поста и вывод их на странице(продумайте где и как их наиболее красиво вывести)
13. *Задание опциональное, можно попробовать когда все сделали, и хочеться поразбираться и попробовать свои силы. Прикрутить внешнее хранение для ваших файлов(amazon ,google drive, etc...)


## Literature

- https://guides.rubyonrails.org/action_view_helpers.html - про вьюшные хелперы
- https://guides.rubyonrails.org/form_helpers.html - про хелперы формы
- https://guides.rubyonrails.org/routing.html - про роутинг
- https://guides.rubyonrails.org/active_storage_overview.html - про актив сторедж
  
- Ознакомиться с http://railscasts.com/episodes/250-authentication-from-scratch-revised. Использовать для помощи в решении написании регистрации/авторизации.


## Requirements

- Ruby 2.7.0
- Rails 6.1.0
- postgresql 12.5
- git (optional)

## Download

Clone this repository into your computer:
```sh
$ git clone https://github.com/alex-rns/RoR_blog
```
or download from [git](https://github.com/alex-rns/RoR_blog)

## How to start

    $ bundle install
    $ rake db:migrate
    $ rails s

- Open your browser and type `localhost:3000`

[Link](https://hw7-blog.herokuapp.com/) to heroku

## Technologies Used

- ruby
- rails
- postgresql
- bootstrap

License
----

MIT





