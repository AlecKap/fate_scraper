require 'httparty'
require 'nokogiri'
require 'csv'
require_relative '../config/environment.rb'
require_relative '../app/models/riddle.rb'

80.times do |i|
  response = HTTParty.get("https://solveordie.com/short/#{i + 1}/")
  if response.code == 200
    puts "Scraping page #{i}... please wait."
  else
    puts "Error: #{response.code}"
  end

  document = Nokogiri::HTML(response.body)  # create a document object with the parsed body of the response.
  all_riddle_containers = document.css('article.r') # use css method to select all riddle containers.
  all_riddle_containers.each do |container|
    # binding.pry
    title = container.css('h2.title').text
    question = container.css('div.q').text
    answer = container.css('div.a').text

    riddle = Riddle.new(title: title, question: question, answer: answer)
    riddle.save
  end
end
