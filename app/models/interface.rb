require 'pry'

class Interface

    attr_reader :prompt
    attr_accessor :user, :superpower, :superhero


    def initialize
        @prompt = TTY::Prompt.new
     end

     #This menu will first be displayed when a user runs rake :start
     def welcome
          user_inpupt=prompt.select("Welcome to the Game of Superheros.") do |menu|
            menu.choice "Register an Account", -> {register_user_helper}
            menu.choice "Log Into Existing Account", -> {user_login_helper}

          end
        end


     #Register a user
     def register_user_helper
        userReturnValue=User.register()
        until userReturnValue
              userReturnValue=User.register()
        end
         self.user=userReturnValue
         self.main_menu
     end

     #Login 
     def user_login_helpepr
        userReturnValue=User.login()
     end
      



     #After a user is registered, this is the main menu that user will see
     def main_menu
         user.reload
         system "clear"
         puts "Welcome, #{self.user.name}"
         prompt.select("What would you like to do?") do |menu|
          menu.choice "View Your Superheros", -> {display_user_superheros}
          menu.choice "Create A Superhero", -> {display_and_add_a_superhero}
          menu.choice "Give Your Superhero A Superpower", ->{display_and_add_superpower}
          menu.choice "Add Your Superhero To An Organization", ->{display_and_add_orgs}
          menu.choice "Edit Your Superheros", -> {}
          menu.choice "Remove Your Superheros", -> {}
          menu.choice "Exit And Log Out", -> {}
         end
     end


     #helper method to get a list of superheros associated with current user
     def display_user_superheros
      puts "*************************"
      puts self.user.superheros.all_names_and_descrip
      puts "*************************"
      sleep 5
      self.main_menu()
     end

     #This helper method will add a superhero to a users collection
     def display_and_add_a_superhero
        choosen_superhero_id=prompt.select("Choose A Superhero Please", Superhero.all_names)
        userSup= UserSuperhero.create(user_id: self.user.id, superhero_id: choosen_superhero_id)
        self.main_menu()
     end

   #This helper method will list all superpowers and assign to a superhero
    def display_and_add_superpower
       super_to_add_power=prompt.select("Which Superhero Would You Like to assign a superpower to?", self.user.superheros.all_names)
       chosen_superpower=prompt.select("Choose a Superpower to assign", Superpower.all_names)
       Superhero.update(super_to_add_power, superpower_id: chosen_superpower)
    #  binding.pry
       self.main_menu()
    end

    def display_and_add_orgs
      super_to_add_power=prompt.select("Which Superhero Would You Like to assign a superpower to?", self.user.superheros.all_names)
      choesen_org=prompt.select("Choose an Organization to be a part of: ", Organization.all_names)
       Superhero.update(super_to_add_power, organization_id:  choesen_org) 

      self.main_menu()
    end
























      end

  
