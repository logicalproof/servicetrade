module Servicetrade
  
  class Tag
    attr_accessor :id, :url, :name
    
    def initialize(id="")
      @id = id
      @url = "/tag" + add_id(@id)
      @name = "tags"
    end

    def id=(id)
      @id = id
      @url = @url + "/#{id.to_s}"
    end

    def allowed_verbs
      return ["GET", "POST", "PUT", "DELETE"]
    end

    def self.list_post_params
      post_params = self.list_put_params
      return post_params
    end

    def self.list_put_params
      return {entityId: {type:"integer", optional: true, allowed_values:[], message: "the id of the entity to apply the tag to (if set, you must also provide entityType and either id or name)"},
              entityType: {type:"integer", optional: true, allowed_values:[], message: "the type of the entity to apply the tag to (if set, you must also provide entityId and either id or name) See list of entity types"},
              id: {type:"integer", optional: true, allowed_values:[], message: "the id of the tag you wish to apply, must also provide entityId and entityType"},
              name: {type:"string", optional: true, allowed_values:[], message: "the name of the tag you wish to create - if one by that name already exists it will be returned without creating a duplicate"}
              }
    end
    

    def self.list_get_params
      return {  entityId: {type:"integer", optional: true, allowed_values:[], message: "tags attached to this entity id only (if set, must also provide entityType)"},
              entityType: {type:"integer", optional: true, allowed_values:[], message: "tags attached to this entity type only (if set, must also provide entityId) See list of entity types"},
                name: {type:"string", optional: true, allowed_values:[], message: "return tags with names containing this text"},
                counts: {type: "boolean", optional: true, allowed_values: [], message: "lif true, response includes a count of how many entities this tag is assigned to, grouped by entity type"}
              }
    end

    private

      def add_id(id)
        if id == ""
          return ""
        else
          return "/#{id}"
        end
      end

  end

end
