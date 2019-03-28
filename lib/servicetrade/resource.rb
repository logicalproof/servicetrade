module Servicetrade
  class Resource

    attr_accessor :url, :name
    attr_reader :allowed_verbs, :put_params, :post_params, :get_params

    def initialize(referenced_resource, id=nil)
      @referenced_resource = referenced_resource
      @name = referenced_resource.name
      @url = referenced_resource.url
      @id = id.to_s
      @allowed_verbs = referenced_resource.allowed_verbs
      @put_params = referenced_resource.list_put_params
      @post_params = referenced_resource.list_post_params
      @get_params = referenced_resource.list_get_params
    end

    def id
      @id.to_s
    end

    def id=(id)
      @id = id
      @url = @referenced_resource.url + add_id(@id)
    end

     private

      def add_id(id)
        if id == ""
          return ""
        else
          return "/#{id.to_s}"
        end
      end

  end
end