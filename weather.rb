require 'nokogiri'
require 'accuweather'

def location (city)
    location_array = Accuweather.city_search(name: city)
    location_array.first
end

def weather (location)
    current_weather = Accuweather.get_conditions(location_id: location.id).current 
    puts "The current weather in #{location.city} is #{current_weather.weather_text} with a temperature of #{current_weather.temperature} F."
end

def forecast (location)
    weather_forecast = Accuweather.get_conditions(location_id: location.id).forecast
    puts "Tomorrow the weather will be #{weather_forecast.first.daytime.weather_text} with a low of #{weather_forecast.first.daytime.low_temperature} F and a high of #{weather_forecast.first.daytime.high_temperature} F."

    for i in 2..5
       puts "#{weather_forecast[i].day_of_week} the weather will be #{weather_forecast[i].daytime.weather_text} with a low of #{weather_forecast[i].daytime.low_temperature} F and a high of #{weather_forecast[i].daytime.high_temperature} F."
    end
end

puts "Where are you? (input city OR zip code)"
city = gets.chomp

location = location(city)

weather(location)
forecast(location)
