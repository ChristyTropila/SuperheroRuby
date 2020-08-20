Superhero.destroy_all
Superpower.destroy_all
Organization.destroy_all
Superhero.reset_pk_sequence
Superpower.reset_pk_sequence
Organization.reset_pk_sequence

#organization seeded data
good_guys=Organization.create(name: "The Good Guys", description: "Good guys only")
super_squad=Organization.create(name: "Super Squad", description: "Daily meetings include mandatory gym session")
chill_and_grill=Organization.create(name: "Chill and Grill", description: "A group of lazy Superheros who sit around and grill all day.")

#superpower seeded data
wood_control=Superpower.create(name: "Control over Wood", description: "Transforms objects into wood")
mental_master=Superpower.create(name: "Mental Master", description: "Instinctively understand mechanical devices and their workings with no prior knowledge")
psychic=Superpower.create(name: "Psychic", description: "A medium with psychic abilities." )
weather_control=Superpower.create(name: "Weather Control", description: "Can control the weather with their mind")
healing_powers=Superpower.create(name: "Healing Powers", description: "Has the ability to heal themself and others.")
vortex_breath=Superpower.create(name: "Vortex Breath", description: "One blow of this breath and you will be sucked into a ferocious whirlpool")

#superhero seeded data
black_star=Superhero.create(name: "Black Star")
scarlet_dragonfly=Superhero.create(name: "The Scarlet Dragonfly")
whispering_cat=Superhero.create(name: "The Whispering Catman")
liquid_steel=Superhero.create(name: "Liquid Steel")
light_smasher=Superhero.create(name: "The Light Smasher")
fearless_ant=Superhero.create(name: "The Fearless Ant")
confident_ox=Superhero.create(name: "The Confident Ox")


#users
user1=User.create(name: "Christy")
user2=User.create(name: "Joby")

#UserSuperheros

user_sup=UserSuperhero.create(user_id: user1.id, superhero_id: black_star.id)

