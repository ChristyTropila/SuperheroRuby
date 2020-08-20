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
        result=Superhero.all.map do |hero|
            {hero.name => hero.id}
           # binding.pry
        end
        result
    # #    binding.pry
     end


    
      #this method interpolates the name of supehero and its associated superpowers and organizations.
      #accounts for possiblity of superheros having yet to be assigned a superpower or organization
    def self.all_names_and_descrip
   
     results=Superhero.all.reload.map do |hero|
     
            if !hero.superpower && !hero.organization

                " NAME: #{hero.name}
                    \n"
            elsif !hero.superpower
                " NAME: #{hero.name}\nORGANIZATION: #{hero.organization.name}--#{hero.organization.description}
                    \n"
            elsif !hero.organization
                " NAME: #{hero.name}\nSUPERPOWER: #{hero.superpower.name}--#{hero.superpower.description}
                   \n"
            else 
                " NAME: #{hero.name}\nSUPERPOWER: #{hero.superpower.name}--#{hero.superpower.description}\n ORGANIZATION: #{hero.organization.name}--#{hero.organization.description}
                  \n"
          
            end
    
    end
    
end

  
    #this method should list out available superheros that have not already been chosen by them in the tty prompt menu.
    #they can select "choose a superhero" on the menu and should not have any superheros that they have already chosen still on that list
    #1)Get a list of all superheros
    #2)Check to see if any superheros has a user_id that is equal to the current users id
    #3)If no match, list that superhero
    #4)If current user id matches the user_id of any superheros, do not display that superhero in the menu choices.

    # def self.names_not_chosen(id)
    #    result= Superhero.all.map do |hero|
    #    # binding.pry
    #         if hero.user_id ==id
    #         else 
    #             {hero.name => hero.id}
    #         end
    #     end
    #     result
    # end
      
  
    
    
     
     def self.names_not_chosen(user)
        superhero_arr=Superhero.all.select{|sh| !sh.users.include?(user)}
        superhero_arr.pluck(:name)
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