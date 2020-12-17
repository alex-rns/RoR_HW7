# **GeekHub X | RoR | Homework 7**

![minion_screen](https://user-images.githubusercontent.com/23439223/102497685-9f26a180-4081-11eb-8efe-c95cf45868bf.png)

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

## Requirements

- Ruby 2.7.0
- Rails 6.1.0  
- postgresql 12.5  
- git (optional)

## Download

Clone this repository into your computer:
```sh
$ git clone https://github.com/alex-rns/RoR_HW7
```
or download from [git](https://github.com/alex-rns/RoR_HW7)

## How to start

    $ bundle install
    $ rake db:migrate
    $ rake db:seed
    $ rails s

- Open your browser and type `localhost:3000`

[Link](https://hw7-blog.herokuapp.com/) to heroku

## Technologies Used

- ruby
- rails
- postgresql
- bootstrap
- gem "faker"

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

License
----

MIT


