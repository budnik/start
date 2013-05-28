actions :add, :remove

attribute :name,                  :kind_of => String,  :name_attribute => true
attribute :server_name,           :kind_of => String
attribute :listen,                :kind_of => Array,  :default => [80]
attribute :redirect_to_url,       :kind_of => String

def initialize(*args)
  super
  @action = :add
end
