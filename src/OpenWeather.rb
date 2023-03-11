#===============================================================================
#
#       Program Name: OpenWeather.rb
#
#       Description: Prompts user to input the name of a city and using the 
#       OpenWeatherAPI return current weather results for the city.
#
#       Language: Ruby
#
#       Date: 2/28/2023
# 
#       Author: Joshua Farias
#
#===============================================================================

#required libraries run 'gem install net-http json dotenv'
require 'net/http' #make http requests to OpenWeather
require 'json' #parse JSON response from API
require 'dotenv/load' #load API key from preset enviornment variable

#fetch weather data for a given city
def fetch_weather_data(city_name)
  api_key = ENV['OPENWEATHER_API_KEY'] #fetch API key from preset environment variable

  #construct url for OpenWeatherAPI
  url = "https://api.openweathermap.org/data/2.5/weather?q=#{city_name}&appid=#{api_key}&units=metric"
  uri = URI(url) #create URI object from url 
  response = Net::HTTP.get(uri) #make get request
  JSON.parse(response) #parse through JSON response and return it
end

#parse through weather data and print it
def print_weather_data(weather_data)
  #extract relevant JSON data from parsed response
  city_name = weather_data['name']
  temp = weather_data['main']['temp']
  feels_like = weather_data['main']['feels_like']
  humidity = weather_data['main']['humidity']
  visibility = weather_data['visibility']
  wind_speed = weather_data['wind']['speed']
  wind_direction = weather_data['wind']['deg']
  dew_point = calculate_dew_point(temp, humidity)
  description = weather_data['weather'][0]['description']

  #print weather data for given city
  puts "Weather in #{city_name}: #{description}"
  puts "Temperature: #{temp}°C"
  puts "Feels like: #{feels_like}°C"
  puts "Humidity: #{humidity}%"
  puts "Visibility: #{visibility}m"
  puts "Wind Speed: #{wind_speed}m/s"
  puts "Wind Direction: #{wind_direction}°"
  puts "Dew Point: #{dew_point}°C"
end

#calculate dew point based on temperature and humidity
def calculate_dew_point(temp, humidity)
  dew_point = (temp - (100 - humidity) / 5.0).round(1)
end

#prompt user for city and fetch/print weather data
print "Open Weather\n"
print "Enter a city name: "
city_name = gets.chomp #read user input 
weather_data = fetch_weather_data(city_name) #calls fetch weather data method

#check if 'cod' key in JSON response is equal to 200(successful API call)
if weather_data['cod'] == 200 #if response is successful print data
  print_weather_data(weather_data)
else
  puts "Error fetching weather data: #{weather_data['message']}" #output error if API call isn't successful
end
