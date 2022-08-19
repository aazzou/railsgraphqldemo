# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user01 = User.create!(
    :email => 'said@email.com',
    :password => 'secret01'
)

user02 = User.create!(
    :email => 'aazzou@email.com',
    :password => 'secret02'
)

Message.create!([{
                     :title => 'Message title 01',
                     :content => "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                     :user => user01
                 },
                 {
                     :title => 'Message title 02',
                     :content => "Ac tortor vitae purus faucibus ornare. Duis convallis convallis tellus id interdum.",
                     :user => user01
                 },
                 {
                     :title => 'Message title 02',
                     :content => "Pretium viverra suspendisse potenti nullam ac tortor vitae. Laoreet non curabitur gravida arcu ac tortor dignissim convallis aenean",
                     :user => user02
                 }])


