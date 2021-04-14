# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
    {
        email: "Joe.Canny@gmail.com",
        password: "test",
        first_name: "Joesph",
        last_name: "Canny"
    },
    {
        email: "AmyMamy@gmail.com",
        password: "test",
        first_name: "Amy",
        last_name: "Morrison"
    },
    {
        email: "DonDuck@gmail.com",
        password: "test",
        first_name: "Donad",
        last_name: "Duck"
    },
    {
        email: "mrmighty@gmail.com",
        password: "test",
        first_name: "Mighty",
        last_name: "Mouse"
    },

    
])