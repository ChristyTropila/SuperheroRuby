require 'pry'

class Superhero < ActiveRecord::Base

    #macro that connects our ruby models to the db
    #a superhero belongs to a superpower and an organization
    belongs_to :superpower
    belongs_to :organization

    has_many :user_superheros
    has_many :users, through: :user_superheros

    

    #CRUD METHODS


    #return a hash of all heros with name id key value pairs
    def self.all_names
        Superhero.all.map do |hero|
            {hero.name => hero.id}
           # binding.pry
        end
    end


    def self.all_superpowers
        Superhero.all.map do |hero|
            {hero.superpower => hero.id}

            #binding.pry
        end
    end

    def find_by_id(id)
       Superhero.all.select do |hero|
        if hero.id=id
         hero
        end
    end
        
    end
























#     #create a new instance of a superhero
#     def self.create
      


#    #READ METHODS
   
#    #returns the names of all the superheros in a hash format
#   def self.all_names
#     Superhero.all.map do |heros|
#        {heros.name => heros.id}
#         end
#     end
    

   
# def self.power_by_superhero
#     Superhero.all.map do |supers|
#         supers.superpower
# binding.pry
#     end
# end




end