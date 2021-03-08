# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@doctor1 = Doctor.create!(name: "William Defoe",
                         years_practiced: 8,
                         university: "Harvard School of Medicine")
@doctor2 = Doctor.create!(name: "Nicole Kidman",
                        years_practiced: 13,
                        university: "University of West Virginia")

@doctor = Doctor.create!(name: "Brad Pitt",
                          years_practiced: 2,
                          university: "University of West Virginia")
