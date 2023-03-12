<h1>
  <img src="https://github.com/joshfarias/Ruby/raw/main/images/ruby-logo.png" alt="ruby logo" height="45">
  Ruby
</h1>
Repo for Ruby programming projects.

## Weather fetching application using OpenWeather's API
**[OpenWeather.py](https://github.com/joshfarias/Ruby/blob/main/src/OpenWeather.rb)**

This program uses [OpenWeather's API](https://openweathermap.org/api) to retrieve and parse through JSON weather data for a given city specified by the user. It uses the `net/http` library to make HTTP requests to the OpenWeather server and `JSON` to parse through the JSON response from the API. The API key is loaded from a preset enviornment variable and is accessed using the `dotenv` library.

Below is a screenshot showing the program in action:

<h1>
<img src="https://github.com/joshfarias/Ruby/blob/main/images/openweather.png" alt="openweather" height="400">
</h1>

### Notes
- Users must have the following libraries for Ruby installed in order for this program to work.
  - `net/http` for making HTTP requests to the OpenWeather server
  - `JSON` to parse through the response from OpenWeather's API
  - `dotenv` to load the API key from an enviornment variable
- These libraries can be installed using the following gem command: `gem install net-http json dotenv`

- The program has the API key set as an environment variable by default, the code can however be modified in the following ways so that the user can set up their API key differently:
  - Use a configuration file to store the API key
  - Pass the API key through a command-line argument
  - Use a keyring library
  - Hardcode the API key (not recommended)
