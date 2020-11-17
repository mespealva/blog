# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(
    [
        {
            email: "lucia@lucia",
            password: "lucia123",
            full_name: "Lucía Alvarez Galvez", 
            type: "Lawyer"
        },
        {
            email: "nico@nico",
            password: "nico123" ,
            full_name: "Nicolás Morales Palma", 
            type: "Lawyer"
        },
        {
            email: "eli@eli",
            password: "eli123",
            full_name: "Elisa Greene Morales", 
            type: "Lawyer"
        },
        {
            email: "jose@jose",
            password: "jose123",
            full_name: "Josefa Zamorano Quiroga", 
            type: "Lawyer"
        },
        {
            email: "juan@juan",
            password: "juan123",
            full_name: "Juan Ignacio Bugueño Sierra", 
            type: "Lawyer"
        },
        {
            email:"sara@sara",
            password:"sara123",
            full_name: "Sara Bertschik", 
            type: "Lawyer"
        },
        {
            email: "maria@maria",
            password: "maria123",
            full_name: "Maria Alvarez", 
            type: "Admin"
        }
    ]
)
15.times do
    Article.create(
            title: Faker::Lorem.word,
            description: Faker::Lorem.paragraph,
            user_id: 1
    )
end

5.times do 
    Category.create(
        name: Faker::Lorem.word
    )
end

20.times do
    ArticleCategory.create(
        article_id: rand(1..15),
        category_id: rand(1..5)
    )
end

