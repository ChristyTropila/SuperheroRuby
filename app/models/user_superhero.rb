class UserSuperhero < ActiveRecord::Base

    belongs_to :user
    belongs_to :superhero


    # def self.get_superhero_name(user_id)
    #  user_name= UserSuperhero.all.find(user_id: user_id)
    #   user_name
    #   binding.pry
    #      end


         #displays all superheros
         def self.all_names
            Superhero.all.map do |heros|
               {heros.name => heros.id}
                end
            end


            #displays all user names
            def self.all_user_names
                User.all.map do |usr|
                    {usr.name => usr.id}
                end
            end

            
            # def self.all_name_no_user
            #     result=UserSuperhero.all.select do |sup|
            #         sup.superhero_id==nil
               
            #     end
            #     result.map do |sup|
            #         sup.superhero
            #       #  binding.pry
            #     end
            #  #   binding.pry
            # end
        


end