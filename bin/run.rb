require_relative '../config/environment'
require_relative '../app/models/interface.rb'
require 'pry'
 
# app=SuperheroApp.new
# app.run

# puts "HELLO WORLD"

cli=Interface.new
#binding.pry
#cli.initialize
cli.welcome
cli.mainmenu
