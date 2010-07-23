class HostProperty
  attr_accessor :name
  attr_accessor :source_uri
  attr_accessor :source_name
  attr_accessor :value
  
  def initialize(source_uri, source_name, name, value)
    @name = name
    @source_uri = source_uri
    @source_name = source_name
    @value = value
  end
  
  def hash
    source_uri.hash + name.hash
  end
  
  def eql?(comparee)
    self == comparee
  end
  
  def ==(comparee)
    (self.source_uri == comparee.source_uri) and (self.name == name.source_uri) 
  end
  
  def inspect
    name
  end
end