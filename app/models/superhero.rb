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


    
      #this method interpolates the name of supehero and its associated superpowers and organizations.
      #accounts for possiblity of superheros having yet to be assigned a superpower or organization
    def self.all_names_and_descrip
   
     results=Superhero.all.reload.map do |hero|
     
            if !hero.superpower && !hero.organization

                "~~NAME: #{hero.name}
                    \n"
            elsif !hero.superpower
                "~~NAME: #{hero.name}\n~~ORGANIZATION: #{hero.organization.name}--#{hero.organization.description}
                    \n"
            elsif !hero.organization
                "~~NAME: #{hero.name}\n~~SUPERPOWER: #{hero.superpower.name}--#{hero.superpower.description}
                   \n"
            else 
                "~~NAME: #{hero.name}\n~~SUPERPOWER: #{hero.superpower.name}--#{hero.superpower.description}\n~~ORGANIZATION: #{hero.organization.name}--#{hero.organization.description}
                  \n"
          
            end
    
    end
    
end



end