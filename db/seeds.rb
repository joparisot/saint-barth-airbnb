# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

urls_walhahlla = [
  'https://drive.google.com/open?id=0B4yc0IuB7OxDaXExZEY5RDFtVFU',
  'https://drive.google.com/open?id=0B4yc0IuB7OxDbUJaZ0FnS1JqR1E',
  'https://drive.google.com/open?id=0B4yc0IuB7OxDNU5rVHowbElWSDA',
  'https://drive.google.com/open?id=0B4yc0IuB7OxDczlXaEVTa0l6SE0'
]

urls_tiwa = [
  'https://drive.google.com/open?id=0B4yc0IuB7OxDR2Z0aHBUenVYYVE',
  'https://drive.google.com/open?id=0B4yc0IuB7OxDV1ljcmhDbzJKV2M',
  'https://drive.google.com/open?id=0B4yc0IuB7OxDeFU5LWlwWU1kcEU'
]

whalhahlla = Villa.new(name: "Whalhahlla", price: "#", address: "test address")
whalhahlla.save!
whalhahlla.photo_urls = urls_walhahlla

tiwa = Villa.new(name: "tiwa", price: "#", address: "test address")
tiwa.save!
tiwa.photo_urls = urls_tiwa
