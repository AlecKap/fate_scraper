require 'httparty'
require 'nokogiri'
require 'csv'
require_relative '../config/environment.rb'
require_relative '../app/models/riddle.rb'

80.times do |i|
  response = HTTParty.get("https://solveordie.com/short/#{i + 1}/.html")
  if response.code == 200
    puts 'Scraping... please wait.'
  else
    puts "Error: #{response.code}"
  end
  binding.pry

  document = Nokogiri::HTML(response.body)  # create a document object with the parsed body of the response.
  all_riddle_containers = document.css('article.r') # use css method to select all riddle containers.
  all_riddle_containers.each do |container|
    title = container.css('h3 a').first['title']
    question = container.css('p.price_color').text.delete('^0-9.')
    answer = container.css('p.price_color').text.delete('^0-9.')

    riddle = Riddle.new(title: title, question: question, answer: answer)
    riddle.save
  end
end
