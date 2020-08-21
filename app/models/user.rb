class User < ActiveRecord::Base 
    has_many :user_superheros
    has_many :superheros, through: :user_superheros


    #register a new user
def self.register
   @@userInfo=TTY::Prompt.new.ask("What is your name?")

   if User.find_by(name: @@userInfo)
      puts "Sorry, it looks like that username is taken."
    else
     User.create(name: @@userInfo)
   end
end

def self.login
  @@userInfo=TTY::Prompt.new.ask("What is your name?")
   logged_in=User.find_by(name: @@userInfo)
     if !logged_in
     "This user does not exist! Try again"
     end
     logged_in
 end

 




end