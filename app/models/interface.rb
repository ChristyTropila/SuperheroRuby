require 'pry'

class Interface
  attr_reader :prompt
  attr_accessor :user, :superpower, :superhero, :heroman, :banner


  def initialize
      @prompt = TTY::Prompt.new
   end

   #This menu will first be displayed when a user runs rake :start
   def welcome
       # Banner.go
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
   def user_login_helper
      userReturnValue=User.login()
        until userReturnValue
            userReturnValue=User.login()
   end
       self.user=userReturnValue
       self.main_menu
  end

  #logout
  def user_log_out
    system 'clear'
    welcome()
  end
    

   #After a user is registered, this is the main menu that user will see
   def main_menu
       user.reload
       system "clear"
       puts"**************************************************************************************************************************"
       puts"**************************************************************************************************************************"
       puts"**************************************************************************************************************************"
       puts"                                                                                                                          "
       puts "WELCOME, #{self.user.name}!!"
       puts "                            "
       prompt.select("What would you like to do?") do |menu|
        menu.choice "View Your Superheros", -> {display_user_superheros}
        menu.choice "Create A Superhero", -> {display_and_add_a_superhero}
        menu.choice "Give Your Superhero A Superpower/Edit", ->{display_and_add_superpower}
        menu.choice "Add Your Superhero To An Organization/Edit", ->{display_and_add_orgs}
        menu.choice "Remove A Superheros From Your Collection", -> {remove_superhero}
        menu.choice "Exit And Log Out", -> {user_log_out}
       end
       
   end


   #helper method to get a list of superheros associated with current user
   def display_user_superheros
    user.reload
    system 'clear'
  # HeroMan.go
    puts "\n"
    puts " You currently have #{self.user.superheros.count} Superheros"
    puts "\n"
    puts self.user.superheros.all_names_and_descrip
    sleep 7
    self.main_menu()
   end

   #This helper method will add a superhero to a users collection
   def display_and_add_a_superhero
      choosen_superhero_id=prompt.select("Choose A Superhero Please", Superhero.names_not_chosen(self.user.id))
      userSup= UserSuperhero.create(user_id: self.user.id, superhero_id: choosen_superhero_id)
      self.main_menu()
   end

# # This helper method will check to see if user has choosen a superhero first
# def superhero_choosen?
#   if self.user.superheros={}
#     puts "You must create a Superhero first!"
#     sleep 3
#     self.main_menu()
#   end
# end

 #This helper method will list all superpowers and assign to a superhero
  def display_and_add_superpower
     super_to_add_power=prompt.select("Which Superhero Would You Like to assign a superpower to?", self.user.superheros.all_names)
     chosen_superpower=prompt.select("Choose a Superpower to assign", Superpower.all_names)
     Superhero.update(super_to_add_power, superpower_id: chosen_superpower)
  #  binding.pry
     self.main_menu()
  end


   #This helper method will add a superhero to an organization
  def display_and_add_orgs
    #superhero_choosen?()
    super_to_add_power=prompt.select("Which Superhero Would You Like to assign a superpower to?", self.user.superheros.all_names)
    choesen_org=prompt.select("Choose an Organization to be a part of: ", Organization.all_names)
    Superhero.update(super_to_add_power, organization_id:  choesen_org)
    self.main_menu()
  end




  #This method list out users superheros and gives them the ability to remove them
  def remove_superhero
    user_input=prompt.multi_select("Which Superhero/s Do You Want To Delete",  self.user.superheros.all_names_and_descrip) 
    user_sup=UserSuperhero.delete(id: self.user.id, superhero_id: user_input)
 #   self.user.update()
    # hero=Superhero.delete(user_id: self.user.id)
    # userdel=User.delete(superhero_id: user_input)
    # self.main_menu()

  end





end