# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ApplicationPet.destroy_all
Application.destroy_all
Pet.destroy_all
Shelter.destroy_all

# Shelters
@shelter1 = Shelter.create!(name: 'Helping Paws Animal Shelter', city: 'Denver', rank: 3, foster_program: true)
@shelter2 = Shelter.create!(name: 'Muddy Claws Animal Shelter', city: 'Minneapolis', rank: 1, foster_program: false)
@shelter3 = Shelter.create!(name: 'Floppy Ears Animal Shelter', city: 'Fort Collins', rank: 4, foster_program: true)
@shelter4 = Shelter.create!(name: 'Sleepy Cat Animal Shelter', city: 'Naperville', rank: 2, foster_program: false)

# Pets
@pet1 = @shelter1.pets.create!(name: 'Leo', breed: 'Pomeranian', age: '1', adoptable: true)
@pet2 = @shelter1.pets.create!(name: 'Collins', breed: 'Tabby', age: '12', adoptable: true)
@pet3 = @shelter1.pets.create!(name: 'Ferdinand', breed: 'Pitbull', age: '4', adoptable: true)
@pet4 = @shelter2.pets.create!(name: 'Hobbes', breed: 'Mixed', age: '3', adoptable: true)
@pet5 = @shelter2.pets.create!(name: 'Gowan', breed: 'Fox', age: '3', adoptable: true)
@pet6 = @shelter2.pets.create!(name: 'Nigel', breed: 'Goldendoodle', age: '2', adoptable: true)
@pet8 = @shelter3.pets.create!(name: 'Winston', breed: 'Border Collie mix', age: '5', adoptable: true)
@pet9 = @shelter3.pets.create!(name: 'Gowan', breed: 'Fox', age: '3', adoptable: true)
@pet10 = @shelter3.pets.create!(name: 'Thor', breed: 'Cattle Dog', age: '10', adoptable: true)
@pet11 = @shelter3.pets.create!(name: 'Luna', breed: 'Tabby', age: '3', adoptable: true)
@pet12 = @shelter4.pets.create!(name: 'Freyja', breed: 'Calico', age: '2', adoptable: true)

# Applications
@app1 = Application.create!(name: 'Grace Joh',
                            street_address: '1949 Bark St',
                            city: 'Minneapolis',
                            state: 'MN',
                            zipcode: '55414',
                            home_description: 'I am super nice to animals.',
                            status: 'Pending')
@app2 = Application.create!(name: 'Logan Cole',
                            street_address: '1459 Catnap St',
                            city: 'Dallas',
                            state: 'TX',
                            zipcode: '75072',
                            home_description: 'I love all cats!',
                            status: 'In Progress')
@app3 = Application.create!(name: 'Alec Kapicak',
                            street_address: '312 Meow Ln',
                            city: 'Chicago',
                            state: 'IL',
                            zipcode: '55414',
                            home_description: 'Seriously, I really really want this animal.',
                            status: 'In Progress')
@app4 = Application.create!(name: 'Crow Rising',
                            street_address: '7463 Quack Dr',
                            city: 'Las Vegas',
                            state: 'NV',
                            zipcode: '55414',
                            home_description: 'ITS SO FLUFFY IM GOING TO DIE!',
                            status: 'In Progress')
@app5 = Application.create!(name: 'Sean Cowans',
                            street_address: '9293 puppy chow Ct',
                            city: 'Denver',
                            state: 'CO',
                            zipcode: '55414',
                            home_description: 'My dog needs a sibling',
                            status: 'In Progress')

@app_pet1 = ApplicationPet.create!(application: @app1, pet: @pet1)
@app_pet2 = ApplicationPet.create!(application: @app1, pet: @pet2)
@app_pet3 = ApplicationPet.create!(application: @app2, pet: @pet3)
@app_pet4 = ApplicationPet.create!(application: @app3, pet: @pet10)
@app_pet5 = ApplicationPet.create!(application: @app3, pet: @pet11)
@app_pet6 = ApplicationPet.create!(application: @app3, pet: @pet12)
@app_pet7 = ApplicationPet.create!(application: @app4, pet: @pet3)
@app_pet8 = ApplicationPet.create!(application: @app4, pet: @pet5)
