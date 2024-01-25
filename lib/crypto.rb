require 'nokogiri'
require 'open-uri'
require "httparty"

page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/"))
tbody = page.xpath("//tbody")

def main (path, page)
  reponse = HTTParty.get(page)
  return false unless response.success?

  crypto_list = []
  path.xpath(".//tr").each do |row|
    name = row.xpath('.//td[3]').text
    value =  row.xpath('.//td[4]').text
    crypto_list.push({name => value})
  end
  puts crypto_list
  return crypto_list.length
end

main(tbody)
