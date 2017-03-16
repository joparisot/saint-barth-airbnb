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
urls_walhahlla1 = [
  # 'https://drive.google.com/open?id=0B4yc0IuB7OxDaXExZEY5RDFtVFU',
  # 'https://drive.google.com/open?id=0B4yc0IuB7OxDbUJaZ0FnS1JqR1E',
  # 'https://drive.google.com/open?id=0B4yc0IuB7OxDNU5rVHowbElWSDA',
  # 'https://drive.google.com/open?id=0B4yc0IuB7OxDczlXaEVTa0l6SE0'
]

# urls_tiwa = [
#   'https://drive.google.com/open?id=0B4yc0IuB7OxDR2Z0aHBUenVYYVE',
#   'https://drive.google.com/open?id=0B4yc0IuB7OxDV1ljcmhDbzJKV2M',
#   'https://drive.google.com/open?id=0B4yc0IuB7OxDeFU5LWlwWU1kcEU'
# ]



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
tiwa.photo_url = 'https://a0.muscache.com/im/pictures/42612027/96c20997_original.jpg?aki_policy=xx_large'

tiwa = Villa.new(name: "Walhalla",
                 price: "618",
                 address: "Aérodrome de St Jean, Saint Barthelemy",
                 description: "Walhalla is a highly favored and private villa located on the hillside of Pointe Milou. It offers a simply stunning ocean view from all the rooms. Guests enjoy the spacious white villa with a pool, its complete privacy and the size of the estate.",
                 number_of_guests: 8,
                 number_of_rooms: 4,
                 number_of_beds: 4,
                 pool: true,
                 user_id: 1,
)
tiwa.save!
tiwa.photo_url = 'https://a0.muscache.com/im/pictures/96698740/65497b9a_original.jpg?aki_policy=xx_large'

# Seeding bookings
