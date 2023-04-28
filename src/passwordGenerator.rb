#===============================================================================
#
#       Program Name: passwordGenerator.rb
#
#       Description: Generates a secure and unpredictable 30-character password
#
#       Language: Ruby
#
#       Date: 3/30/2023
# 
#       Author: Joshua Farias
#
#===============================================================================

def generate_password(length=30) #password generator method and init length
    #defs array of ranges for chars, digits and special chars and flatten them into a single array of characters
    chars = [('a'..'z'), ('A'..'Z'), ('0'..'9'), '!@#$%^&*'.chars].map { |range| range.to_a }.flatten
    password = '' #init empty password string
    length.times { password << chars.sample } #loop through array generating random chars until length is met 
    password #returns generated password
  end
  
  puts generate_password(30) #calls method which prints password to terminal
