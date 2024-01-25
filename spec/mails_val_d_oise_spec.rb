require_relative "../lib/mails_val_d_oise.rb"
require 'rubygems'
require 'nokogiri'
require 'open-uri'

describe "mail extraction" do
    it "extracts the townhall email adress" do
        expect(mail_extractor("https://annuaire-des-mairies.com/95/ableiges.html")).to eq("mairie.ableiges95@wanadoo.fr")
    end
    it "will return an empty mail adress if it has no mail" do
        expect(mail_extractor("https://annuaire-des-mairies.com/95/vaudherland.html")).to eq("")
    end
end
