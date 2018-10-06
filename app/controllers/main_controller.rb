require_relative "../services/weather_service"

class MainController < ApplicationController

  def index
    # Uncomment and pass a parameter to the get function
    if params[:city]
      @w = WeatherService.get(params[:city])
      if @w
        @temperature = (9 / 5) * (@w[:temperature] - 237) + 32
      end

      city = City.new(name: params[:city], temperature: @temperature, description: @w[:description])

      city.save
    end

  end

end
