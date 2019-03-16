# This class is designed to take a servicetrade parsed response and create an output file as a csv. THIS DATA SHOULD BE GENERAL OUTPUTS; IT IS UP TO THE END USER TO MODIFY THE REPONSE BEFORE PROCESSING
module ServiceTrade
  
  class ResponseProcessor
    
    def initialize
    end

    def process_tag_data(tags)
      output_file = File.new("TagOutput#{Time.now.to_i}.csv", 'w+')
      output_file << "ID, Name, URI, counts\n"
      tags.each do |tag|  
        counts = 0
        if tag["counts"]
          tag["counts"].each do |c|
            counts += c["count"]
          end
        end
        output_file << "#{tag["id"]},#{tag["name"]},#{tag["uri"]},#{counts}\n"
      end
      output_file.close
      nil
    end
  end
end