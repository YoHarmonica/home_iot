module Api
  module V1
    class TemperaturesController < ApplicationController
      protect_from_forgery with: :null_session

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

      def insert
        @record = Temperature.new
        @record.place = user_params[:place]
        @record.temperature = user_params[:temperature]
        @record.humidity = user_params[:humidity]
        @record.pressure = user_params[:pressure]
        if @record.save!
          render  json: @record
        else

        end
      end

      private

      def user_params
        params.permit(:place, :temperature, :humidity, :pressure)
      end
    end
  end
end
