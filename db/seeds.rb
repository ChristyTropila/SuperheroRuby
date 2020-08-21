Superhero.destroy_all
Superpower.destroy_all
Organization.destroy_all
Superhero.reset_pk_sequence
Superpower.reset_pk_sequence
Organization.reset_pk_sequence

#organization seeded data
juniors=Organization.create(name: "Junior Squad", description: "Junior Squad is the limbo between being just a ordinary human to discovering one's special power. Low budget organization.")
super_squad=Organization.create(name: "Super Squad", description: "Daily meetings include mandatory gym session. Must bring personal protein shaker bottle to join.")
chill_and_grill=Organization.create(name: "Chill and Grill", description: "A group of lazy Superheros who sit around and grill all day. A great excuse to get out of the house!")
anxiety=Organization.create(name: "The Worry Warts", description: "This group is for the Superheros that are always worried. Most days are spent sitting in a circle being worried together. Accomplish nothing.")
over_achievers=Organization.create(name: "The Real Heros", description: "This is the place where all Superheros strive to be a part of. The Real Heros are the Superheros that keep the world safe!")


#superpower seeded data
wood_control=Superpower.create(name: "Control over Wood", description: "Transforms objects into wood")
mental_master=Superpower.create(name: "Mental Master", description: "Instinctively understand mechanical devices and their workings with no prior knowledge")
psychic=Superpower.create(name: "Psychic", description: "A medium with psychic abilities." )
weather_control=Superpower.create(name: "Weather Control", description: "Can control the weather with their mind")
gabbiness=Superpower.create(name: "Gabble Babble", description: "The ability to literally talk enemies ears off. Once enemies are sucked into conversation, they are unable to leave and will lose their ears")
healing_powers=Superpower.create(name: "Healing Powers", description: "Has the ability to heal themself and others.")
vortex_breath=Superpower.create(name: "Vortex Breath", description: "One blow of this breath and you will be sucked into a ferocious whirlpool")

#superhero seeded data
black_star=Superhero.create(name: "Black Star")
chatty_katty=Superhero.create(name: "Lior the Gabby Cat")
scarlet_dragonfly=Superhero.create(name: "The Scarlet Dragonfly")
doctor_pig=Superhero.create(name: "Doctor Hog")
whispering_cat=Superhero.create(name: "The Whispering Catman")
liquid_steel=Superhero.create(name: "Liquid Steel")
karma=Superhero.create(name: "Karma")
light_smasher=Superhero.create(name: "The Light Smasher")
fearless_ant=Superhero.create(name: "The Fearless Ant")
confident_ox=Superhero.create(name: "The Confident Ox")



#UserSuperheros

user_sup=UserSuperhero.create(user_id: user1.id, superhero_id: black_star.id)

