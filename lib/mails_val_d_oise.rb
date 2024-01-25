
require 'nokogiri'
require 'httparty'
require "open-uri"

url = 'https://annuaire-des-mairies.com/val-d-oise.html'

def mail_extractor(city_url)
  response = HTTParty.get(city_url)
  return false unless response.success?
  page = Nokogiri::HTML(response.body)

  
  mail = page.at_xpath('//tbody/tr[4]/td[2]').text

  return mail
end


def get_city_infos(url)
  response = HTTParty.get(url)
  return false unless response.success?
  page = Nokogiri::HTML(response.body)

  city_infos = []

  page.css('a.lientxt').each do |city_link|
    city_url = URI.join(url, city_link['href']).to_s
    city_name = city_link.text

    town_hall_mails = mail_extractor(city_url)
    city_infos.push({ city_name => town_hall_mails })
  end

  return city_infos
end



city_array = get_city_infos(url)
puts city_array
