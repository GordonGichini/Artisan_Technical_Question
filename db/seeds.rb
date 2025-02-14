require 'faker'

20.times do 
    Book.create!(
        title: Faker::Book.title,
        author: Faker::Book.author,
        isbn: Faker::Number.number(digits: 10),
        available: true
    )
end

puts "Seeded #{Book.count} books."