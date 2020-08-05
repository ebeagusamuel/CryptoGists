# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Following.destroy_all
Comment.destroy_all
Gist.destroy_all
User.destroy_all

10.times do |index|
  user = User.new(name: Faker::Name.name, username: Faker::Twitter.screen_name)
  user.profile_image.attach(io: File.open('app/assets/images' + "/profile#{index + 1}.jpg"), filename: "profile#{index + 1}.jpg", content_type: 'image/jpg')
  user.cover_image.attach(io: File.open('app/assets/images' + "/cover#{index + 1}.jpg"), filename: "cover#{index + 1}.jpg", content_type: 'image/jpg')
  user.save
  Gist.create(user_id: user.id, body: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4))
end
