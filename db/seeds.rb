Short.create!([{
    url:'https://www.google.es/'
},
{
    url:'http://www.marca.com/'
},
{
    url:'https://www.xataka.com/'
},
{
    url:'http://www.laprovincia.es/multimedia/fotos/deportes/2017-05-21-92847-real-madrid-celebra-liga-malaga.html'
},
{
    url:'https://www.facebook.com/'
},
{
    url:'https://www.youtube.com/results?search_query=ruby+on+rails'
},
{
    url:'www.ulpgc.es'
},
{
    url:'https://aulaga.dis.ulpgc.es/'
},
{
    url:'https://github.com/'
},
{
    url:'https://es.aliexpress.com/'
},
{
    url:'http://zapatos.com/'
}])

User.create!([{
    email:'guille22ce@gmail.com',
    password: 'admin123',
    password_confirmation: 'admin123',
    admin: true
},
{
    email:'admin@admin.com',
    password: 'admin123',
    password_confirmation: 'admin123',
    admin: true
},
{
    email:'alguien@gmail.com',
    password: 'alguien',
    password_confirmation: 'alguien',
    admin: false
},
{
    email:'alguien2@gmail.com',
    password: 'alguien2',
    password_confirmation: 'alguien2',
    admin: false
},
{
    email:'alguien3@gmail.com',
    password: 'alguien3',
    password_confirmation: 'alguien3',
    admin: false
},
{
    email:'alguien4@gmail.com',
    password: 'alguien4',
    password_confirmation: 'alguien4',
    admin: false
},
{
    email:'alguien5@gmail.com',
    password: 'alguien5',
    password_confirmation: 'alguien5',
    admin: false
},
{
    email:'alguien6@gmail.com',
    password: 'alguien6',
    password_confirmation: 'alguien6',
    admin: false
},
{
    email:'alguien7@gmail.com',
    password: 'alguien7',
    password_confirmation: 'alguien7',
    admin: false
},
{
    email:'alguien8@gmail.com',
    password: 'alguien8',
    password_confirmation: 'alguien8',
    admin: false
}])

Advertisement.create!([{
    title:  'Anuncio 1',
    user_id: 3,
    picture: File.open(File.join(Rails.root,"/app/assets/images/logo.png"))
},
{
    title:  'Anuncio 2',
    user_id: 3,
    picture: File.open(File.join(Rails.root,"/app/assets/images/logo.png"))
},
{
    title:  'Anuncio 3',
    user_id: 3,
    picture: File.open(File.join(Rails.root,"/app/assets/images/logo.png"))
},
{
    title:  'Anuncio 4',
    user_id: 3,
    picture: File.open(File.join(Rails.root,"/app/assets/images/logo.png"))
},
{
    title:  'Anuncio 5',
    user_id: 3,
    picture: File.open(File.join(Rails.root,"/app/assets/images/logo.png"))
},
{
    title:  'Anuncio 6',
    user_id: 3,
    picture: File.open(File.join(Rails.root,"/app/assets/images/logo.png"))
},
{
    title:  'Anuncio 7',
    user_id: 3,
    picture: File.open(File.join(Rails.root,"/app/assets/images/logo.png"))
},
{
    title:  'Anuncio 8',
    user_id: 3,
    picture: File.open(File.join(Rails.root,"/app/assets/images/logo.png"))
},
{
    title:  'Anuncio 9',
    user_id: 3,
    picture: File.open(File.join(Rails.root,"/app/assets/images/logo.png"))
},
{
    title:  'Anuncio 10',
    user_id: 3,
    picture: File.open(File.join(Rails.root,"/app/assets/images/logo.png"))
}])