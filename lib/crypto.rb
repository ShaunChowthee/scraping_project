require 'rubygems'
require 'nokogiri'
require 'open-uri'
   
url = Nokogiri::HTML(URI.open("https://fr.wikipedia.org/wiki/Wikip%C3%A9dia:Accueil_principal")) 
