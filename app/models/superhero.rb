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
         Superhero.all.map do |hero|
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