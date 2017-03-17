# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Booking.destroy_all
Villa.destroy_all

# if !Villa.find_by(name:"Tiwa").nil?
#   Villa.find_by(name:"Tiwa").destroy
# end

# if !Villa.find_by(name:"Walhalla").nil?
#   Villa.find_by(name:"Walhalla").destroy
# end

# Booking.where(villa_id: nil).destroy_all

# Seeding User. Can i do that?


# Seeding villas
urls_walhahlla = [
  "http://res.cloudinary.com/joparisot/image/upload/v1489685242/Walhalla_-_19_jdcykn.jpg",
  'http://res.cloudinary.com/joparisot/image/upload/v1489685242/Walhalla_-_04_y8e2sb.jpg',
  'http://res.cloudinary.com/joparisot/image/upload/v1489685242/Walhalla_-_03_ucapfp.jpg',
  'http://res.cloudinary.com/joparisot/image/upload/v1489685242/Walhalla_-_02_vok5sx.jpg'
]

urls_tiwa = [
  'http://res.cloudinary.com/joparisot/image/upload/v1489685665/Clair_de_Lune_-_006_nmarea.jpg',
  'http://res.cloudinary.com/joparisot/image/upload/v1489685665/Clair_de_Lune_-_005_fvhcqj.jpg',
  'http://res.cloudinary.com/joparisot/image/upload/v1489685665/Clair_de_Lune_-_004_kr7vht.jpg',
  'http://res.cloudinary.com/joparisot/image/upload/v1489685665/Clair_de_Lune_-_002_bzl2g7.jpg'
]


tiwa = Villa.new(name: "Tiwa",
                 price: "381",
                 address: "Hotel Christopher, Pointe Milou, Saint Barthelemy",
                 description: "Tiwa is a highly favored and private villa located on the hillside of Pointe Milou. It offers a simply stunning ocean view . Guests enjoy the spacious white villa with a pool, its complete privacy and the size of the estate.",
                 number_of_guests: 4,
                 number_of_rooms: 2,
                 number_of_beds: 2,
                 pool: true,
                 user_id: 1,
)
tiwa.image_urls = urls_tiwa
tiwa.save!

walhalla = Villa.new(name: "Walhalla",
                 price: "618",
                 address: "Aérodrome de St Jean, Saint Barthelemy",
                 description: "Walhalla is a highly favored and private villa located on the hillside of Pointe Milou. It offers a simply stunning ocean view from all the rooms. Guests enjoy the spacious white villa with a pool, its complete privacy and the size of the estate.",
                 number_of_guests: 8,
                 number_of_rooms: 4,
                 number_of_beds: 4,
                 pool: true,
                 user_id: 1,
)
walhalla.image_urls = urls_walhahlla
walhalla.save!

# Seeding bookings
