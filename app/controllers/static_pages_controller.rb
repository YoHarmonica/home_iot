class StaticPagesController < ApplicationController
  def home
    @temperatures = Temperature.where(place: 'living').order(created_at: :desc).limit(60)
    @temperatures = @temperatures.map do |temperature|
      {
        id: temperature.id,
        place: temperature.place,
        temperature: temperature.temperature,
        humidity: temperature.humidity,
        pressure: temperature.pressure,
        created_at: temperature.created_at
      }
    end
  end

  def help; end
end
