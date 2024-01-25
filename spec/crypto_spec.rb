require_relative "../lib/crypto.rb"
require 'rubygems'
require 'nokogiri'
require 'open-uri'
   
page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/"))
tbody = page.xpath("//tbody")

describe "main function" do
    it "should return an array containing 100 elements" do
        expect(main(tbody)).to eq(100)
    end
end
