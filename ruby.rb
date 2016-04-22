require 'httparty'
require 'nokogiri'
require 'pp'

old_volume = 0
while true
response = HTTParty.get('https://bitcoinwisdom.com/')
dom = Nokogiri::HTML(response.body)
# p dom
volume = dom.xpath('//tr[@id="o_btccny"]//td')[9].content.gsub(",","").to_i
# p volume


if volume > old_volume
  puts "#{volume} ⬆"
elsif volume < old_volume
  puts "#{volume} ⬇"
else
  puts "#{volume} 😎"
end
old_volume = volume
# sleep 1
end




# puts response.body
# puts response.code
# puts response.headers
