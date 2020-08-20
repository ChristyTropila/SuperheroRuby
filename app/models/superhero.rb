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

    # def self.all_name_no_user
    #    result=Superhero.all.select do |hero|
    #       hero.user




    
      #this method interpolates the name of supehero and its associated superpowers and organizations.
      #accounts for possiblity of superheros having yet to be assigned a superpower or organization
    def self.all_names_and_descrip
   
     results=Superhero.all.reload.map do |hero|
        !user.superheroes.include?(superhero)
            if !hero.superpower && !hero.organization
<<<<<<< HEAD
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
          
=======
                "NAME: #{hero.name}
                         \n "
            elsif !hero.superpower
                "NAME: #{hero.name}\nORGANIZATION: #{hero.organization.name}--#{hero.organization.description}
                         \n"
            elsif !hero.organization
                 "NAME: #{hero.name}\nSUPERPOWER: #{hero.superpower.name}--#{hero.superpower.description}
                         \n"
            else 
                "NAME: #{hero.name}\nSUPERPOWER: #{hero.superpower.name}---#{hero.superpower.description}\nORGANIZATION: #{hero.organization.name}---#{hero.organization.description}
                         \n"
>>>>>>> 6852d2ef4ed67b79db408c94d326ccbc670467c5
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
      
  
    
        


<<<<<<< HEAD
=======




















    # def self.all_superpowers
    #   superVar=Superpower.all.map do |hero|
    #   3     if hero.superheros==self
    #            hero.name
    #       #  binding.pry
    #     end
    # end
    #              #binding.pry
    #     end

>>>>>>> 6852d2ef4ed67b79db408c94d326ccbc670467c5
     
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