class SmallTelescopeObject < ApplicationRecord

    def self.scrape #alter for SmallTele use
        if !!self.first == false || self.first.created_at.day != Time.now.day
            self.destroy_all
            doc = open('https://theskylive.com/guide?geoid=5206379')
            tables = Nokogiri::HTML(doc).css('table.observingplan:not([id])')
            index = 1
            tables.each do |table|
                table.css('tr').each_with_index do |object|
                    if object.text.include?('Naked Eye')
                        object_hash = {
                            name: object.at_css('td.object a').text.strip,
                            url: 'https://theskylive.com' + object.at_css('td.object a')['href'],
                            magnitude: object.at_css('td.magnitude').text
                        }
                        times = object.css('td:not([class]) a')
                        
                        if index == 1 
                            object_hash[:set] = times.first.text.strip
                        elsif index == 2
                            object_hash[:rise] = times.first.text.strip
                            object_hash[:set] = times.last.text.strip
                        else
                            object_hash[:rise] = times.first.text.strip
                        end
                        self.create(object_hash)
                    end
                end
                index += 1
            end
        end
    end
end
