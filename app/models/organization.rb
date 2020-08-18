class Organization < ActiveRecord::Base

    #macro that connects our ruby models to the db
    #An organization will have many superheros and many superpowers through superheroes
    has_many :superheros
    has_many :superpowers, through: :superheros




    #get all organizations namee
    def self.get_organization_names
        orgs=Organization.all.map do |org|
            org.name
        end
    end


    def self.get_superpower_through_superhero(name)
        hero=Superhero.new(name)
        hero
     end
end