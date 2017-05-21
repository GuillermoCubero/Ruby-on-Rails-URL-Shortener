<h1 style="text-align: center;">Prototipo de acortador de URL's en Ruby on Rails</h1>
<p style="text-align: center;">En este README está documentada toda la información necesaria para crear un acortador de
URL's paso a paso, lo desglosaremos en 7 Iteraciones distintas que encontrarás a continuación.
Para mayor comodidad puedes utilizar este índice.</p>

***

**Índice**
1. [Iteración 1](#id1) → Creación de la aplicación.
2. [Iteración 2](#id2) → Acortando nuestra primera URL.
3. [Iteración 3](#id3) → Trabajando en el front-end.
4. [Iteración 4](#id4) →
5. [Iteración 5](#id5) →
6. [Iteración 6](#id6) →
7. [Iteración 7](#id7) →

***

## Iteración 1 <a name="id1"></a>
En la **Iteración 1** se trabajará el esqueleto de una aplicación Rails con una 
página de inicio básica (estática). Será una aplicación en Rails 5 con una página 
básica que muestre un “Hello World!”. El aspecto aproximado que tomará será el 
siguiente:

![](http://imgur.com/1XkQogn.jpg)

A continuación se describirán los pasos a seguir para conseguirlo:

### En primer lugar antes de empezar cada iteración, es recomendable crear una rama nueva para trabajar en el proyecto
```
git checkout -b nueva-rama-para-iteración1
```
Si no tienes configurado tu Git en tu entorno de desarrollo visita [esta página](https://git-scm.com/book/es/v1/Empezando-Configurando-Git-por-primera-vez) 
para configurarlo.

### Instalación de Rails 5.0.2
```
gem install rails -v 5.0.2
```
  
### Creación de la aplicación
```
rails new short_url -T
```
  
- -T skip test

### Arrancar el servidor en Cloud9
```
rails server -b $IP -p $PORT
```

### Para visitar la aplicación
https://short-url-guillermocubero.c9users.io/

### Añadimos la gema rspec-rails al Gemfile
```
group :development, :test do
  gem 'rspec-rails', '~> 3.5'
end
```

### Ejecutamos el comando para inicializar spec
```
rails generate rspec:install
````

### Añadimos la gema capyvara al Gemfile 
```
group :development, :test do
  gem 'capybara'
end
```

### Creamos la carpeta features en /short_url/spec y creamos un test para la hello page con el siguiente contenido:
```
require "rails_helper"

RSpec.feature "RSpec Test", :type => :feature do
  scenario "Visit the Hello Page" do
    visit "/greetings/hello"
    expect(page).to have_text("Hello, World!")
  end
end
```

Para saber mas acerca de **RSpec** visita la página de [Relish.](https://relishapp.com/rspec/rspec-rails/v/3-5/docs/model-specs)

### Hacemos correr los test esperando el ciclo rojo
```
rspec spec/features/hello_page_spec.rb
```

### Definimos en el greetings_controller un método para renderizar un Hello World!
```
def hello
  render html: "Hello, World!"
end
```

### Añadimos en el archivo /config/routes.rb
```
get 'greetings/hello'
```

### Ejecutamos de nuevo los test esperando el ciclo rojo
```
rspec spec/features/hello_page_spec.rb
```

### Ejecutamos un comando Rails para generar un controlador "greetings_controller"
```
rails generate scaffold_controller greetings_controller
```
### Ejecutamos de nuevo los test esperando el ciclo verde
```
rspec spec/features/hello_page_spec.rb
```

### Guardamos los cambios en nuestro repositorio de GitHub de la siguiente manera:
- git add -A
- git commit -m "Mensaje del commit"
- git checkout master
- git merge nueva-rama-para-iteración1

***

## Iteración 2 <a name="id2"></a>
En la **Iteración 2** se trabajará en añadir el acortador de Urls. Dada una url, introducirla, 
hacer click en el botón “Acortar” y generar la url acortada. El aspecto aproximado que tomará será el 
siguiente:

![](http://imgur.com/kRB27ns.jpg)

A continuación se describirán los pasos a seguir para conseguirlo:

### En primer lugar antes de empezar cada iteración, es recomendable crear una rama nueva para trabajar en el proyecto
```
git checkout -b nueva-rama-para-iteración2
```

### Creamos en la carpeta featuresun test para la short page con el siguiente contenido:
```
require 'rails_helper'

RSpec.feature 'RSpec Test', :type => :feature do
  
  before do
    visit '/'
  end
  
  scenario 'Visit the Short Url Page' do
    expect(page).to have_title('URL shorter')
  end
  
  scenario 'Short a blank URL' do
    fill_in 'Url', with: ''
    click_button 'Create Short'
    expect(page).to have_content("Url can't be blank")
  end
  
  scenario 'Short an invalid URL' do
    fill_in 'Url', with: 'http://urldepruebaquefallará'
    click_button 'Create Short'
    expect(page).to have_content('Url is invalid')
  end
  
  scenario 'Short a valid URL' do
    fill_in 'Url', with: 'https://www.google.com/'
    click_button 'Create Short'
    expect(page).to have_content('Short was successfully created.')
    click_link('id-of-link') 
    expect(current_path).to eql('https://www.google.com/')
  end
  
end

```
Aqui hemos definido los escenarios posibles ante los que se puede encontrar nuestra
aplicación en la página para acortar las URL's.

### Hacemos correr los test esperando el ciclo rojo
```
rspec spec/features/short_url_page_spec.rb
```

### Creamos mediante Rails nuestro controlador de la siguiente manera
```
rails generate controller Short user_url:string
```

### A continuación para empezar a pasar los test modificamos el archivo de routes.rb
Añadimos la siguiente línea: **root 'shorts#new'** de la siguiente manera
```
Rails.application.routes.draw do
  resources :shorts
  root 'shorts#new'
  get 'greetings/hello'
end
```

### Empezaremos con el primer test que visita la página y comprueba su título
Para conseguir pasar el primer test debemos editar la línea **&lt;title&gt;URL shorter&lt;/title&gt;**
en el archivo aplication.html.erb de esta forma:

```
<!DOCTYPE html>
<html>
  <head>
    <title>URL shorter</title>
    <%= csrf_meta_tags %>

    <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track': 'reload' %>
    <%= javascript_include_tag 'application', 'data-turbolinks-track': 'reload' %>
  </head>

  <body>
    <%= yield %>
  </body>
</html>
```

### Hacemos correr los test y comprobamos que el primer test ejecuta correctamente
```
rspec spec/features/short_url_page_spec.rb
```

### Continuamos con los siguientes tests
- Debe introducir una URL en blanco en nuestro formulario y mostrarnos un mensaje de error.
- Debe introducir una URL inválida en nuestro formulario y mostrarnos un mensaje de url inválida.
- Debe introducir una URL válida en nuestro formulario y permitirla.

Para conseguir pasar dichos test modificamos el modelo de nuestra aplicación en **short_url/app/models/short.rb**
con el siguiente código.
```
class Short < ApplicationRecord
    VALID_URL_REGEX = /\A((http|https|ftp|ftps):\/\/)?(([a-z0-9]+\:)?[a-z0-9]+\@)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?\z/
    validates :user_url, presence: true, format: { with: VALID_URL_REGEX }
end
```
Aquí hemos definido una variable **"VALID_URL_REGEX"** para almacenar la expresión regular que 
comprobará si las URL's introducidas cumplen el formato.

Para entender mejor el formato puedes visitar [Rubular.](http://rubular.com/)

### Hacemos correr los test esperando el ciclo verde
```
rspec spec/features/short_url_page_spec.rb
```

### Modificamos los test de la vista 
Para cumplir con la nueva regla de validación de una URL los test que modificamos fueron:
- edit.html.erb_spec.rb
- index.html.erb_spec.rb
- show.html.erb_spec.rb

### Creamos en el modelo el siguiente método para generar la url acortada
```
class Short < ApplicationRecord
    VALID_URL_REGEX = /https?:\/\/[\S]+\.[\S]+/
    validates :url, presence: true, format: { with: VALID_URL_REGEX }

    
    def short_url
        self.id.to_s(36)
    end
    
end
```

### Creamos en el modelo el siguiente método para redirigir las urls acortadas a las originales
```  
  def redirect_id
    redirect_to Short.find(params[:id].to_i(36)).url
  end
```

### Alteramos el archivo routes.rb con el siguiente contenido
```
Rails.application.routes.draw do
  resources :shorts
  root 'shorts#new'
  get 'greetings/hello'
  get ":id", to: "shorts#redirect_id"
end
```

### Y finalmente alteramos la vista del show.html.erb para ver las URL acortadas y poder visitarlas.
```
<p id="notice"><%= notice %></p>

<p><strong>Url: </strong><%= @short.url %></p>
<p><strong>Shorted Url: </strong><%= link_to request.base_url + '/' + @short.short_url, @short.url, id:'id-of-link' %></p>

<%= link_to 'Edit', edit_short_path(@short) %> |
<%= link_to 'Back', shorts_path %>
```
Hemos añadido la **id:'id-of-link'** para poder hacer click y visitarla desde el test

### Creamos test sobre el modelo 
Comprueban que la URL se acorta de manera correcta.

```
require 'rails_helper'

RSpec.describe Short, type: :model do
    
    let(:short) { Short.create(id: 1234567890, url: 'http://www.google.es') }
    let(:valids) { %w[https://www.google.es http://google.es https://google.es www.google.es google.es] }
    let(:invalids) { %w[http://www.google. https://.google.es http://google. https://google http://.] }
    
    subject { short }
     
    it { should respond_to(:id) }
    it { should respond_to(:url) }
    it { should respond_to(:short_url) }
    
    it { should be_valid }
    
    context 'Short an URL' do
        
        it 'has to translate the id to b36' do
            expect(short.short_url).to eq short.id.to_s(36)
        end
        
        it 'has to percive when url is not present' do
            short.url = nil
            expect(short).not_to be_valid
        end
        
        it 'has to percibe when url is valid' do
            valids.each do |valid_url|
                short.url = valid_url
                expect(short).to be_valid
            end
        end
        
        it 'has to percibe when url is invalid' do
            invalids.each do |invalid_url|
                short.url = invalid_url
                expect(short).not_to be_valid
            end
        end

    end
        
end
```

Para encontrar ejemplos de tests de modelo profesionales visita [BetterSpecs](http://www.betterspecs.org/#expect) o
el **GitHub** de [Michael Hartl.](https://github.com/mhartl/sample_app/blob/master/spec/models/user_spec.rb)

### Guardamos los cambios en nuestro repositorio de GitHub de la siguiente manera:
- git add -A
- git commit -m "Mensaje del commit"
- git checkout master
- git merge nueva-rama-para-iteración2

***

## Iteración 3 <a name="id3"></a>
En la **Iteración 3** se trabajará en añadir un aspecto sencillo y limpio a nuestra aplicación con la herramienta Bootstrap.
Se trabajará la parte comúnmente llamada front-end de la aplicación.

A continuación se describirán los pasos a seguir para conseguirlo:

### En primer lugar antes de empezar cada iteración, es recomendable crear una rama nueva para trabajar en el proyecto
```
git checkout -b nueva-rama-para-iteración3
```

### Comenzaremos añadiendo la herramienta a nuestro Gemfile
```
gem 'bootstrap-sass', '3.3.6'
```
Ejecutamos el comando **bundle install** para que se cargue de nuestro *Gemfile*.

### Creamos nuestra página de estilo donde colocaremos el CSS que se requiera
```
touch app/assets/stylesheets/custom.scss
```
Importamos dentro Bootstrap de la siguiente manera:
```
@import "bootstrap-sprockets";
@import "bootstrap";
```

### Agregamos en primer lugar un estilo general a la página
```
/* Variables */

$dark: #000;

/* Estilo general */

body {
  padding-top: 40px;
  margin: 33px;
}

section {
  overflow: auto;
}

textarea {
  resize: vertical;
}

.center {
  text-align: center;
  h1 {
    margin-bottom: 10px;
  }
}

a:hover{
    text-decoration: none;
}
```

Con estas pocas reglas nuestra página se verá mucho mas ordenada. Durante este proyecto 
usaremos Sass, una herramienta que nos permite tratar el css de una aplicación de manera
más programática. Para saber mas visita [Sass.](http://sass-lang.com/)

### En primer lugar voy a crear un header para mi aplicación

Creamos dentro de **short_url/app/views/layouts** un archivo llamado _header.html.erb, en él crearemos
la cabecera de nuestra aplicación que renderizaremos posteriormente. Su contenido será el siguiente:

```
<header class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <%= link_to "URL Shortener", root_path, id: "logo" %>
        <!-- Brand and toggle get grouped for better mobile display -->
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
        </button>
        <nav>
            <ul class="nav navbar-nav navbar-right">
                <li><%= link_to "Log in", '#' %></li>
            </ul>
        </nav>
    </div>
</header>
```

En el hemos añadido varias clases de Bootstrap básicas. Para saber más visita [Bootstrap.](http://getbootstrap.com/)

### Realizamos la misma acción para el footer

Creamos dentro de **short_url/app/views/layouts** un archivo llamado _footer.html.erb, en él crearemos
el pie de página de nuestra aplicación que renderizaremos posteriormente. Su contenido será el siguiente:

```
<footer class="footer">
  <nav>
    <ul>
      <small> Acortador de URL's en Ruby on Rails 5.</small>
      <li><a href="https://github.com/GuillermoCubero/short-url">See the code</a></li>
    </ul>
  </nav>
</footer>
```

### Ahora editaremos nuestro archivo aplication.html.erb de la siguiente manera

```
<!DOCTYPE html>
<html>
  <head>
    <title>URL shortener</title>
    <%= csrf_meta_tags %>
    <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track': 'reload' %>
    <%= javascript_include_tag 'application', 'data-turbolinks-track': 'reload' %>
  </head>
  <body>
    <%= render 'layouts/header' %>
    <%= yield %>
    <%= render 'layouts/footer' %>
  </body>
</html>
```
En él hemos renderizado la cabecera y el pie de página por encima y por debajo del contenido.

### Una vez editado vamos a añadir algunas reglas del CSS para que esté todo más ordenado

```
.
.
.
/* Estilo del header */

#logo {
  float: left;
  margin-right: 10px;
  font-size: 1.7em;
  color: $dark;
  text-transform: uppercase;
  letter-spacing: -1px;
  padding-top: 10px;
  font-weight: bold;
  &:hover {
  color:$dark;
  text-decoration: none;
  }
}

/* Estilo del footer */

footer {
  margin-top: 45px;
  padding-top: 5px;
  border-top: 1px solid $dark;
  color: $dark;
  a {
    color: $dark;
    &:hover {
      color: $dark;
    }
  }
  small {
    float: left;
  }
  ul {
    float: right;
    list-style: none;
    li {
      float: left;
      margin-left: 15px;
    }
  }
}
```

### Hecho esto nos dispondremos a cambiar el estilo de la página principal y veremos como queda
Editamos el archivo *new.html.erb* dentro de **short_url/app/views/shorts** de la siguiente manera:
```
<div class="page-header">
  <h1>New Short <small>Short your url here</small></h1>
</div>

<div class="row">
  <div class="col-lg-6 ">
    <%= render 'form', short: @short %>
  </div>
</div>

<div class="boton_inicio">
    <%= link_to 'Back', shorts_path, class: "btn btn-default" %>
</div>
```

También editaremos el aspecto de nuestro formulario en **short_url/app/views/shorts/_form.html.erb** así:
```
<%= form_for(short) do |f| %> 
  <%= render 'shared/error_messages', object: @short %>
  <%= f.label :url, "Introduce an URL to short:" %>
  <div class="input-group">
    <%= f.text_field :url, class: "form-control"%>
    <span class="input-group-btn"><%= f.submit "Create short", class: "btn btn-default" %></span>
  </div>
<% end %>
```

Y finalmente creamos el archivo **_error_messages.html.erb** dentro de la carpeta que crearemos en **short_url/app/views/** llamada *shared*, 
**(short_url/app/views/shared/_error_messages.html.erb)**:

```
<% if object.errors.any? %>
    <div id="error_explanation">
        <div class="alert alert-danger">
            <h4>The form contains <%= pluralize(object.errors.count, "error") %>.</h4>
        </div>
        <ul>
        <% object.errors.full_messages.each do |message| %>
          <li><h5><%= message %></h5></li>
        <% end %>
        </ul>
    </div>
<% end %>

```

De esta manera nuestra página principal lucirá tal que así:
![](http://imgur.com/gFYmM0i.jpg)

### Añadimos algunas reglas más al CSS para finalizar la página principal
```
.
.
.
/* Estilo de los mensajes de error */

#error_explanation {
  color: red;
  ul {
    color: red;
    margin: 0 0 30px 0;
  }
}

.field_with_errors {
  @extend .has-error;
  .form-control {
    color: $state-danger-text;
  }
}

/* Estilo del boton de incio */
.boton_inicio {
  margin-top: 45px;
  padding-top: 5px;
  color: $dark;
}
```

Y el estilo de la página principal al mostrar un error será el siguiente:

![](http://imgur.com/iAe94ka.jpg)

### Continuamos con el estilo de la página index.html.erb
```
<div class="page-header">
  <h1>Shorts <small>See the shortened urls here</small></h1>
</div>

<div class="panel panel-default">
  <!-- Default panel contents -->
  <div class="panel-heading"><h4>Manage shortened URLs</h4></div>
  <div class="panel-body">
    <table class="table">
      
    <thead>
      <tr>
        <h4>Users url</h4>
        <th colspan="3"></th>
      </tr>
    </thead>
    
    <tbody>
      <% @shorts.each do |short| %>
        <tr>
          <td><h5><%= short.url %></h5></td>
            <td><%= link_to 'Show', short, class: "btn btn-info" %></td>
            <td><%= link_to 'Edit', edit_short_path(short), class: "btn btn-primary" %></td>
            <td><%= link_to 'Destroy', short, method: :delete, data: { confirm: 'Are you sure?' }, class: "btn btn-danger" %></td>
          </div>
        </tr>
      <% end %>
    </tbody>
    
  </table>
  </div>
  <div class="panel-footer">
    <%= link_to 'New Short', new_short_path, class: "btn btn-success" %>
  </div>
</div>
```

Y se ve de la siguiente manera:

![](http://imgur.com/Nbbfawj.jpg)

### Continuaremos con la página de show.html.erb

```
<div class="alert alert-success" role="alert">
    <p id="notice"><%= notice %></p>
</div>

<div class="page-header">
  <h1>Show <small>Your URL</small></h1>
</div>

<div class="panel panel-default">
    <div class="panel-heading"><h4>See your URL info</h4></div>
    <div class="panel-body">
        <h5><strong>Url: </strong><%= @short.url %></h5>
        <h5><strong>Shorted Url: </strong><%= link_to request.base_url + '/' + @short.short_url, @short.url, id:'id-of-link' %></h5>
    </div>
    <div class="panel-footer">
    <%= link_to 'Edit', edit_short_path(@short), class: "btn btn-primary" %> 
    <%= link_to 'Back', shorts_path, class: "btn btn-default" %>
    </div>
</div>
```

Y se ve de la siguiente manera:

![](http://imgur.com/2gNWGcd.jpg)

### Por último este será el aspecto de la página de edit.html.erb
```
<div class="page-header">
  <h1>Edit <small>Your URL</small></h1>
</div>
<div class="panel panel-default">
    <div class="panel-heading"><h4>Edit your URL info</h4></div>
    <div class="panel-body">
        <%= render 'edit_form', short: @short %>
    </div>
    <div class="panel-footer">
        <%= link_to 'Show', @short,  class: "btn btn-info" %> 
        <%= link_to 'Back', shorts_path, class: "btn btn-default" %>
    </div>
</div>
```
Y se ve de la siguiente manera:

![](http://imgur.com/6SOMvKd.jpg)

### Guardamos los cambios en nuestro repositorio de GitHub de la siguiente manera:
- git add -A
- git commit -m "Mensaje del commit"
- git checkout master
- git merge nueva-rama-para-iteración3