class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'

    @url = 'https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=85041&distance=25&API_KEY=5969B31A-F875-4C93-8CFF-6EFC82DA630B'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)

# check for empty return result
    if @output.empty?
          @final_output = "Error"
    elsif  !@output
        @final_output = "Error"
    else
        @final_output = @output[0]['AQI']
    end

    if @final_output == "Error"
      @api_color = "silver"
    elsif @final_output <= 50 
      @api_color = "green"
      @api_description = ""
    elsif @final_output >= 51 && @final_output <= 100
      @api_color = "yellow"
      @api_description = ""
    elsif @final_output >= 101 && @final_output <= 150
      @api_color = "orange"
      @api_description = ""
    elsif @final_output >= 151 && @final_output <= 200
      @api_color = "red"
      @api_description = ""
    elsif @final_output >= 201 && @final_output <= 300
      @api_color = "purple"
      @api_description = ""
    elsif @final_output >= 301 && @final_output <= 500
      @api_color = "maroon"
      @api_description = ""

    end

  end
end
