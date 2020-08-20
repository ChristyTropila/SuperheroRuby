class UserSuperhero < ActiveRecord::Base

    belongs_to :user
    belongs_to :superhero

    
    # def self.get_superhero_name(user_id)
    #  user_name= UserSuperhero.all.find(user_id: user_id)
    #   user_name
    #   binding.pry
    #      end


        #  #displays all superheros
        #  def self.all_names(id)
        #    selection=  self.all.map do |current|
        #       if  current.user_id==id
        #           current.superhero.name
        #         #  binding.pry
        #      end
        #     end
        #     selection
        # end

            # def self.user_with_no_match
            #    id_hash= UserSuperhero.all.map do |u_sup|
            #        {u_sup.superhero_id => u_sup.id}
            #      #  binding.pry
            #     end
            #   result= id_hash.map do |hashes|
            #    Superhero.find_by_id(hashes.keys)
      
            #     end
            #     result
            #    # binding.pry
        
            # end

          #   def self.iterator_heros(current_user)
          # #   UserSuperhero.user_with_no_match.select do |heros|
          # #     !heros.user_id == nil
          # #  puts "{#{heros.name} => #{heros.id}}" # why is this coming up as nil class . undefined method for 'nil' class
          # #  #  binding.pry
          # #    end
          # #  return results
          # #    binding.pry

          #   # 1) We want to find all the superheros that are not related to a user
          #   # 2) We already know the user superheros by calling on .superheros on User instance
          #   # 3) Maybe take aray of all superheros and remove the one that match array from step 2
          # # selected_heros=current_user.superheros
          #         if current_user.superheros.length > 0
          #           Superhero.first
          #         else
          #           Superhero.all
          #         end

             
          #   binding.pry


          #   end

              


end