## Iteración 1
Definición del la tarea
  
## Instalación de Rails 5.0.2
```
$ gem install rails -v 5.0.2
```
  
## Creación de la aplicación
```
$ rails new short_url -T
```
  
- -T skip test

## Arrancar el servidor en Cloud9
```
$ rails server -b $IP -p $PORT
```

## Para visitar la aplicación
https://short-url-guillermocubero.c9users.io/

## Añadimos la gema rspec-rails al Gemfile
```
group :development, :test do
  gem 'rspec-rails', '~> 3.5'
end
```

## Ejecutamos el comando para inicializar spec

## Añadimos la gema capyvara al Gemfile 
```
group :development, :test do
  gem 'capybara'
end
```

## Creamos un test para el greetings_controller_spec.rb ???
```
rails generate ...
```

## Creamos la carpeta features en /short_url/spec y creamos un test para la hello page
```

```

## Hacemos correr los test esperando el ciclo rojo
```
rails spec spec/features/hello_page_spec.rb
```

## Definimos en el greetings_controller un método para renderizar un Hello World!
```
def hello
  render html: "Hello, World!"
end
```

## Añadimos en el archivo /config/routes.rb
```
get 'greetings/hello'
```

## Ejecutamos de nuevo los test esperando el ciclo rojo
```
rails spec spec/features/hello_page_spec.rb
```

