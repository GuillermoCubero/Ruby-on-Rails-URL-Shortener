# Prototipo de acortador de URL's en Ruby on Rails / URL Shortener prototype on Ruby on Rails
#### En este README está documentada toda la información necesaria para usar el prototipo de acortador de URLs.
#### This README documents all the information necessary to use the URL shortener prototype.
***
#### Esto es un prototipo de acrtador de URLs realizado como proyecto final para el Grado de Ingeniería Informática de la [Universidad de Las Palmas de Gran Canaria](http://www.ulpgc.es/)
#### This is an URL Shortener prototype realized as final project for the Degree of Computer Engineering of the [University of Las Palmas de Gran Canaria.](http://www.ulpgc.es/)

![](http://imgur.com/VGGenya.jpg)

***

### Inicialización del git
```
git init
```

### Descarga de la aplicación desde GitHub
```
git pull https://github.com/GuillermoCubero/short-url
```

### Instalación de Rails 5.0.2
```ruby
gem install rails -v 5.0.2
```

### Instalar las gemas necesarias
```ruby
bundle install
```
  
### Creación de la aplicación
```ruby
rails new short_url -T
```
  
- -T skip test

### Creación de la base de datos

Añadir a la ruta */config* el archivo **database.yml** con el siguiente contenido:

```ruby
# SQLite version 3.x
#   gem install sqlite3
development:
  adapter: sqlite3
  database: db/development.sqlite3
  pool: 5
  timeout: 5000

# Warning: The database defined as "test" will be erased and
# re-generated from your development database when you run "rake".
# Do not set this db to the same as development or production.
test:
  adapter: sqlite3
  database: db/test.sqlite3
  pool: 5
  timeout: 5000

production:
  adapter: sqlite3
  database: db/production.sqlite3
  pool: 5
timeout: 5000
```

### Migrar y llenar la base de datos

```ruby
rails db:migrate
rails db:seed
```

### Instalar aplicaciones necesarias para el funcionamiento de la app
```ruby
sudo apt-get update
sudo apt-get install imagemagick --fix-missing
```

### Arrancar el servidor en Cloud9
```ruby
rails server -b $IP -p $PORT
```

### Para visitar la aplicación
https://nombredeaplicacio-nombredeusuario.c9users.io/