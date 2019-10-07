module Servicetrade
  class ResourceInterface
    attr_reader :url

    def initialize(id=nil)
      @id = id.to_s
      @url = base_url
    end

    def id
      @id.to_s
    end

    def base_url
      ""
    end

    def id=(id)
      @id = id
      @url = base_url + add_id_to_url(@id)
    end

     private

      def add_id_to_url(id)
        if id == "" || id.nil?
          return ""
        else
          return "/#{id.to_s}"
        end
      end

  end
end