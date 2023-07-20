require 'httparty'
require 'nokogiri'
require 'csv'
require_relative '../config/environment.rb'
require_relative '../app/models/cat_pic.rb'

2.times do |i|
  response = HTTParty.get("https://stocksnap.io/search/cat")
  if response.code == 200
    puts "Scraping page #{i}... please wait."
  else
    puts "Error: #{response.code}"
  end
# binding.pry
  document = Nokogiri::HTML(response.body)  # create a document object with the parsed body of the response.
  all_riddle_containers = document.css('div a') # use css method to select all riddle containers.
  all_riddle_containers.each do |container|
    binding.pry
    url1 = container.css('a.src').text
    url2 = container.css('h2.title').text
   

    riddle = Riddle.new(title: title, question: question, answer: answer)
    riddle.save
  end
end
