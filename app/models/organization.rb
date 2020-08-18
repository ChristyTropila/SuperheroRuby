class Organization < ActiveRecord::Base

    #macro that connects our ruby models to the db
    #An organization will have many superheros and many superpowers through superheroes
    has_many :superheros
    has_many :superpowers, through: :superheros



    #get all organizations namee
    def self.all_names
        Organization.all.map do |org|
            {"#{org.name} - #{org.description}" => org.id}
        end
    end


end