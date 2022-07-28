# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
BEACH_IMG_URL = 'https://media.istockphoto.com/photos/tropical-beach-palm-trees-sea-wave-and-white-sand-picture-id1300296030?b=1&k=20&m=1300296030&s=612x612&w=0&h=VbByOfT1WE2OwH7ILNIDFV9Xdj-bBIVH5msMQjFTPkc='
MOUNTAIN_IMG_URL = 'https://images.unsplash.com/photo-1585409677983-0f6c41ca9c3b?ixlib=rb-1.2.1&w=1080&fit=max&q=80&fm=jpg&crop=entropy&cs=tinysrgb'
LAKE_IMG_URL = 'https://images.unsplash.com/photo-1620065263283-f084beb12754?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bGFrZXN8ZW58MHx8MHx8&w=1000&q=80'
Category.create name: 'long day'
20.times do |n|
  name  = Faker::Mountain.name
  starday = "#{n+1}-6-2022"
  destination = 'destination'
  tourday = 1
  price = Faker::Number.within(range: 1..10).to_i * 100000
  rated = 2
  category_id = 1
  tour_img_file_name = [BEACH_IMG_URL, MOUNTAIN_IMG_URL, LAKE_IMG_URL].sample
  detail = 'detail'
  Tour.create! name: name,
              starday: starday,
              destination: destination,
              tourday: tourday,
              price: price,
              rated: rated,
              category_id: category_id,
              tour_img_file_name: tour_img_file_name,
              detail: detail
end
