# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Review.destroy_all
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

urls_wagon = [
  'https://i.ytimg.com/vi/L_3R_0txd5o/maxresdefault_live.jpg',
  'http://collectif.io/wp-content/uploads/2015/08/Lewagon4.jpg',
  'http://collectif.io/wp-content/uploads/2015/08/Lewagon3.jpg'
]

urls_playboy = [
  'http://kingofwallpapers.com/villa/villa-004.jpg',
  'http://randheli.chevalblanc.com/src/medias/villas/owners-villa/owners-villa-1-3.jpg',
  'http://i.telegraph.co.uk/multimedia/archive/03545/playboy-mansion-po_3545560b.jpg'
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
tiwa.save!
tiwa.image_urls = urls_tiwa


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
walhalla.save!
walhalla.image_urls = urls_walhahlla

wagon = Villa.new(name: "Le Wagon",
                 price: "5900",
                 address: "Rue Lubin Brin, 97133 Gustavia",
                 description: "Learn all about Ruby, SQL, and the Rails application framework. Develop your front-end skills by using advanced CSS technics (flexbox, grid, animations, etc..) and go deeper into Javascript by learning jQuery and React.js, the library developed by Facebook",
                 number_of_guests: 22,
                 number_of_rooms: 4,
                 number_of_beds: 0,
                 pool: false,
                 user_id: 1,
)
wagon.save!
wagon.image_urls = urls_wagon

playboy = Villa.new(name: "Alexandria",
                 price: "8999",
                 address: "Saint Barthelemy Natural Reserve, Saint-Barthélemy",
                 description: "The Playboy Mansion is the home of Playboy magazine founder Hugh Hefner. In Holmby Hills, Los Angeles, California, near Beverly Hills, the mansion became famous during the 1960s through media reports of Hefner's lavish parties",
                 number_of_guests: 120,
                 number_of_rooms: 35,
                 number_of_beds: 70,
                 pool: true,
                 user_id: 1,
)
playboy.save!
playboy.image_urls = urls_playboy



# Seeding bookings
