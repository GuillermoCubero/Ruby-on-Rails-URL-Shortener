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
    admin: true,
    name: 'Oliverio',
    company: 'Universidad de Las Palmas de Gran Canaria'
},
{
    email:'alguien@gmail.com',
    password: 'alguien',
    password_confirmation: 'alguien',
    admin: false,
    name: 'Alguien',
    company: 'Universidad de Las Palmas de Gran Canaria'
},
{
    email:'heladeria@gmail.com',
    password: 'heladeria',
    password_confirmation: 'heladeria',
    admin: false,
    name: 'Heladero',
    company: 'Heladeria Fria'
},
{
    email:'cantante@gmail.com',
    password: 'cantante',
    password_confirmation: 'cantante',
    admin: false,
    name: 'Anthony Kiedis',
    company: 'Red Hot Chilli Pepers'
},
{
    email:'frases@gmail.com',
    password: 'frases',
    password_confirmation: 'frases',
    admin: false,
    company: 'Frases motivadoras'
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
    admin: false,
    company: 'ONG Pacifista'
},
{
    email:'alguien7@gmail.com',
    password: 'alguien7',
    password_confirmation: 'alguien7',
    admin: false,
    company: 'Miguel Guisado' 
},
{
    email:'alguien8@gmail.com',
    password: 'alguien8',
    password_confirmation: 'alguien8',
    admin: false
}])

Advertisement.create!([{
    title:  'Nuevo Máster de la EII',
    user_id: 3,
    picture: File.open(File.join(Rails.root,"/app/assets/images/master.jpg"))
},
{
    title:  'Helados al 25%',
    user_id: 4,
    picture: File.open(File.join(Rails.root,"/app/assets/images/helado.png"))
},
{
    title:  'Nuevo disco en breve',
    user_id: 5,
    picture: File.open(File.join(Rails.root,"/app/assets/images/redhot.jpg"))
},
{
    title:  'Reflexiona sobre ello',
    user_id: 6,
    picture: File.open(File.join(Rails.root,"/app/assets/images/frase.jpg"))
},
{
    title:  'No a la guerra',
    user_id: 8,
    picture: File.open(File.join(Rails.root,"/app/assets/images/granada.jpg"))
},
{
    title:  'Apuntate al Doble Grado y hazte rico!!',
    user_id: 3,
    picture: File.open(File.join(Rails.root,"/app/assets/images/doble.jpg"))
},
{
    title:  'Entra al grado y disfruta de tu carrera soñada',
    user_id: 3,
    picture: File.open(File.join(Rails.root,"/app/assets/images/gii.jpg"))
},
{
    title:  'Aquapark, descuentos para alumnos en lluvia del 50%',
    user_id: 3,
    picture: File.open(File.join(Rails.root,"/app/assets/images/escuela.jpg"))
},
{
    title:  'No te asustes y presenta sin miedo',
    user_id: 9,
    picture: File.open(File.join(Rails.root,"/app/assets/images/presenta.jpg"))
},
{
    title:  'Escudo',
    user_id: 3,
    picture: File.open(File.join(Rails.root,"/app/assets/images/escudo.jpg"))
}])