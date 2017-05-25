require 'barometer'

def weather_now (location)
  barometer = Barometer.new(location)
  weather = barometer.measure

  current_status = weather.current.icon

  current_temp= weather.current.temperature.f.to_i

  puts "It is currently #{current_status} and #{current_temp} where you are!"

end

puts "Where are you looking for a weather report of? Please enter your 5-digit postal code:"

location = gets.to_s

weather_now(location)


def get_locations_weather(location)
  Barometer.new(location).measure
end

weather_forecast = get_locations_weather(location)
today = Time.now.strftime('%d').to_i
tomorrow = Time.now.strftime('%d').to_i + 1

weather_forecast.forecast.each do |forecast|
  day = forecast.starts_at.day

  if day == today
    dayName = 'Today'
  elsif day ==tomorrow
    dayName = 'Tomorrow'
  else
    dayName = forecast.starts_at.strftime('%A')
  end

  puts dayName + ' is going to be ' + forecast.icon + ' with a low of ' + forecast.low.f.to_s + ' and a high of ' + forecast.high.f.to_s
end
