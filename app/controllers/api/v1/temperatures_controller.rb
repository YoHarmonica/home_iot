module Api
  module V1
    class TemperaturesController < ApplicationController
      def index
        @temperatures = Temperature.where('place = ?', user_params[:place]).order(created_at: :desc).limit(60)
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
        render json: @temperatures
      end

      private

      def user_params
        params.permit(:place)
      end
    end
  end
end
