module Rainforest
  class ApiResource
    attr_reader :api_method
    attr_reader :json
    attr_reader :client

    def initialize(json=nil, api_method=nil, client=nil)
      refresh_from(json, api_method, client)
    end

    def refresh_from(json={}, api_method=nil, client=nil)
      unless json.is_a?(Hash)
        json = { :id => json }
      end
      json = Util.symbolize_keys(json)

      # Clear or write over any old data
      clear_api_attributes
      @api_method = api_method
      @json = Util.sorta_deep_clone(json)
      @client = client || Rainforest.default_client

      # Use json (not the @json, the cloned copy)
      json.each do |k, v|
        unless self.class.api_attribute_names.include?(k.to_sym)
          self.class.add_api_attribute(k.to_sym)
        end
        instance_variable_set("@#{k}", determine_api_attribute_value(k, v))
      end
      self
    end

    # Returns the default client
    def self.client
      Rainforest.default_client
    end

    def inspect
      id_string = (self.respond_to?(:id) && !self.id.nil?) ? " id=#{self.id}" : ""
      "#<#{self.class}:0x#{self.object_id.to_s(16)}#{id_string}> Attributes: " + JSON.pretty_generate(inspect_api_attributes)
    end

    def inspect_nested
      id_string = (self.respond_to?(:id) && !self.id.nil?) ? " id=#{self.id}" : ""
      "#<#{self.class}:0x#{self.object_id.to_s(16)}#{id_string}>"
    end

    def to_json(*args)
      JSON.generate(api_attributes)
    end

    def self.api_attribute_names
      @api_attributes.map(&:first)
    end

    def self.editable_api_attribute_names
      @api_attributes.select do |k, v|
        v[:editable]
      end.map(&:first)
    end

    def self.add_api_attribute(name)
      attr_accessor name.to_sym
      @api_attributes[name.to_sym] = {}
    end

    def api_attributes
      ret = {}
      self.class.api_attribute_names.each do |attribute|
        ret[attribute] = self.send(attribute)
      end
      ret
    end

    def inspect_api_attributes
      ret = {}
      api_attributes.each do |k, v|
        if v.is_a?(ApiResource)
          ret[k] = v.inspect_nested
        else
          ret[k] = v
        end
      end
      ret
    end

    # TODO(joncalhoun): Fix this (not currently working as intended)
    def changed_api_attributes
      ret = {}
      self.api_attributes.each do |name, value|
        if @json[name] != value
          ret[name] = value
        end
      end
      ret
    end

    def editable_api_attributes
      ret = {}
      self.class.editable_api_attribute_names.each do |name|
        ret[name] = self.send(name)
      end
      ret
    end

    def clear_api_attributes
      self.class.api_attribute_names.each do |name|
        instance_variable_set("@#{name}", nil)
      end
    end

    def self.determine_api_attribute_value(name, raw_value)
      if @api_attributes[name] && @api_attributes[name].has_key?(:constructor)
        klass = Util.constantize(@api_attributes[name][:constructor])
        if(klass.respond_to?(:construct))
          klass.construct(raw_value)
        else
          klass.new(raw_value)
        end
      else
        ApiObject.construct(raw_value)
      end
    end

    def determine_api_attribute_value(name, raw_value)
      self.class.determine_api_attribute_value(name, raw_value)
    end


    def self.api_subclasses
      return @api_subclasses ||= Set.new
    end

    def self.api_subclass_fetch(name)
      @api_subclasses_hash ||= {}
      if @api_subclasses_hash.has_key?(name)
        @api_subclasses_hash[name]
      end
    end

    def self.register_api_subclass(subclass, name=nil)
      @api_subclasses ||= Set.new
      @api_subclasses << subclass

      unless name.nil?
        @api_subclasses_hash ||= {}
        @api_subclasses_hash[name] = subclass
      end
    end

    @api_attributes = {}
  end
end
