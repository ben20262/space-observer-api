require 'nokogiri'
require 'open-uri'

class VisibleObject < ApplicationRecord

    def self.scrape
        doc = open('https://theskylive.com/guide?geoid=5206379')
        tables = Nokogiri::HTML(doc).css('table.observingplan:not([id])')
        objects = []
        tables.each do |table|
            table.css('tr').each_with_index do |object, index|
                if object.text.include?('Naked Eye')
                    object_hash = {
                        name: object.at_css('td.object a').text.strip,
                        url: 'https://theskylive.com' + object.at_css('td.object a')['href'],
                        magnitude: object.at_css('td.magnitude').text,
                        
                    }
                    times = object.css('td:not([class])')
                    if index == 0 
                        object_hash[:set] = times[0].text.strip
                    elsif index == 1
                        object_hash[:rise] = times[0].text.strip
                        object_hash[:set] = times[1].text.strip
                    else
                        object_hash[:rise] = times[0].text.strip
                    end
                    self.create(object_hash)
                end
            end
        end
    end

end
