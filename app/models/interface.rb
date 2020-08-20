

require 'pry'


class Interface
  attr_reader :prompt
  attr_accessor :user, :superpower, :superhero, :heroman, :banner
  
  

   def initialize
      @prompt = TTY::Prompt.new(symbols: {markers: "*"})
   end

   #This menu will first be displayed when a user runs rake :start
   def welcome
        Banner.go
        puts"    
       #                    #######                  #######                      ######                             #####                          #     #                             ### 
       #  ####  # #    #       #    #    # ######    #       #    # #    #        #     # #    # # #      #####     #     #  ####  #    # ######    #     # ###### #####   ####   ####  ### 
       # #    # # ##   #       #    #    # #         #       #    # ##   #        #     # #    # # #      #    #    #       #    # ##  ## #         #     # #      #    # #    # #      ### 
       # #    # # # #  #       #    ###### #####     #####   #    # # #  #        ######  #    # # #      #    #     #####  #    # # ## # #####     ####### #####  #    # #    #  ####   #  
 #     # #    # # #  # #       #    #    # #         #       #    # #  # # ###    #     # #    # # #      #    #          # #    # #    # #         #     # #      #####  #    #      #     
 #     # #    # # #   ##       #    #    # #         #       #    # #   ## ###    #     # #    # # #      #    #    #     # #    # #    # #         #     # #      #   #  #    # #    # ### 
  #####   ####  # #    #       #    #    # ######    #        ####  #    # ###    ######   ####  # ###### #####      #####   ####  #    # ######    #     # ###### #    #  ####   ####  ### 
                                                                                                                                                                                                                                                                                                                                   
    ".colorize(:blue)
        user_inpupt=prompt.select("\nWelcome to the Game of Superheros.") do |menu|
          menu.choice "\n\nRegister an Account", -> {register_user_helper}
          menu.choice "\nLog Into Existing Account", -> {user_login_helper}
       
        end

      system 'clear'
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

     #log_out
    def user_log_out
       system 'clear'
       welcome()
    end
      

     #After a user is registered, this is the main menu that user will see
     def main_menu
      system 'clear'
         user.reload

puts"  

███████╗██╗   ██╗██████╗ ███████╗██████╗ ██╗  ██╗███████╗██████╗  ██████╗ ███████╗██╗██╗██╗██╗
██╔════╝██║   ██║██╔══██╗██╔════╝██╔══██╗██║  ██║██╔════╝██╔══██╗██╔═══██╗██╔════╝██║██║██║██║
███████╗██║   ██║██████╔╝█████╗  ██████╔╝███████║█████╗  ██████╔╝██║   ██║███████╗██║██║██║██║
╚════██║██║   ██║██╔═══╝ ██╔══╝  ██╔══██╗██╔══██║██╔══╝  ██╔══██╗██║   ██║╚════██║╚═╝╚═╝╚═╝╚═╝
███████║╚██████╔╝██║     ███████╗██║  ██║██║  ██║███████╗██║  ██║╚██████╔╝███████║██╗██╗██╗██╗
╚══════╝ ╚═════╝ ╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝╚═╝╚═╝╚═╝                                                                                          
                                                                                              
".colorize(:blue)

         puts "\n\nWELCOME, #{self.user.name}!!".bold
         prompt.select("\nWhat would you like to do?") do |menu|
          menu.choice "\n\n\nView Your Superheros", -> {display_user_superheros}
          menu.choice "\nCreate A Superhero", -> {display_and_add_a_superhero}
          menu.choice "\nGive Your Superhero A Superpower/Edit", ->{display_and_add_superpower}
          menu.choice "\nAdd Your Superhero To An Organization/Edit", ->{display_and_add_orgs}
          menu.choice "\nDelete A Superheros From Your List", -> {remove_superhero}
          menu.choice "\nExit And Log Out", -> {user_log_out}
         end
         
         
     end


     #helper method to get a list of superheros associated with current user
     def display_user_superheros
      user.reload
      system 'clear'
      HeroMan.go
      puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
      puts "\n"
      puts "          ~~~~~~~~~~~~ You currently have #{self.user.superheros.count} Superheros ~~~~~~~~~~~~"
      puts "\n"
      puts self.user.superheros.all_names_and_descrip
      sleep 7
      self.main_menu()
     end





     #this method will make sure that the user isn't seeing any superheros that they already have collected
    def iterator_heros
        results=[]
        other_results=[]
        Superhero.all.select do |hero| 
        #  binding.pry
        if  self.user.superheros.include?(hero)
           results << {hero.name => hero.id}
        else  
           other_results << {hero.name => hero.id}
        end
        end
        other_results
      end

        



 #This helper method will add a superhero to a users collection
    def display_and_add_a_superhero
        #binding.pry
        user.reload
        system 'clear'
        choices=iterator_heros
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "\n"
        choosen_superhero=prompt.select("Choose A Superhero Please", choices )
        userSup= UserSuperhero.create(user_id: self.user.id, superhero_id: choosen_superhero)
        # binding.pry
        system 'clear'
        self.main_menu()
            
    end


   #This helper method will list all superpowers and assign to a superhero
    def display_and_add_superpower
        user.reload
        system 'clear'
        superhero_choosen?
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "\n"
        choices=self.user.superheros.all_names
        super_to_add_power=prompt.select("Which Superhero Would You Like to assign a superpower to?", choices)
        chosen_superpower=prompt.select("Choose a Superpower to assign", Superpower.all_names)
        Superhero.update(super_to_add_power, superpower_id: chosen_superpower)
      #  binding.pry
        self.main_menu()
    end
  

 #This helper method will add a superhero to an organization
    def display_and_add_orgs
        user.reload
        system 'clear'
        superhero_choosen?
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "\n"
        choices=self.user.superheros.all_names
        super_to_add_power=prompt.select("Which Superhero Would You Like to assign a superpower to?", choices)
        choesen_org=prompt.select("Choose an Organization to be a part of: ", Organization.all_names)
        Superhero.update(super_to_add_power, organization_id:  choesen_org) 
        #binding.pry
        self.main_menu()
     end

# This helper method will check to see if user has choosen a superhero first
    def superhero_choosen?
       if self.user.superheros.empty?
         puts "You must create a Superhero first!"
         sleep 3
        self.main_menu()
       end
    end


  #This method list out users superheros and gives them the ability to remove them
    def remove_superhero
      user.reload
      system 'clear'
      user_input=prompt.select("Which Superhero/s Do You Want To Delete",  self.user.superheros.all_names) 
      result=UserSuperhero.all.find_by(user_id: self.user.id, superhero_id: user_input)
      result.delete
      # binding.pry
      self.main_menu()
    end   









end