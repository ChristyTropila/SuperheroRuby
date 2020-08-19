class User < ActiveRecord::Base 
    has_many :user_superheros
    has_many :superheros, through: :user_superheros


    #register a new user
def self.register
   userInfo=TTY::Prompt.new.ask("What is your name?")

   if User.find_by(name: userInfo)
      puts "Sorry, it looks like that username is taken."
    else
     User.create(name: userInfo)
   end
end


   #login a user
def self.login
    userInfo=TTY::Prompt.new.ask("What is your name?")
    logedIn=User.find_by(name: userInfo)
 
    if !logedIn
       puts "Sorry, it looks like that username doesn't exist!"
     end
     logedIn
end













    # #this method will add a superhero object into a user array
    # def add_superhero_to_users_list(superhero)
    #     self.superheros << superhero
    #     superhero.users << self
    # end

    # def delete_superhero_from_self(superhero)
    #     self.find(superhero.superhero_id).delete_all
    # end

 

    # def self.get_all_superheros
        
    # #    heros_list= UserSuperhero.all.map do |heros|
    # #         heros.superhero_id
    # #       #  binding.pry
    # #         # binding.pry
    # #         end
    #     self.superheros.map do |hero|
    #    binding.pry
    #     end
    # end

end