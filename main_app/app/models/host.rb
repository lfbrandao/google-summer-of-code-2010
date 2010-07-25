require "rexml/document"

class Host
  attr_reader :uri
  attr_writer :uri
  attr_reader :uri_data

  def self.index
    xml = File.read('/Users/luisbrandao/Documents/GSoC10/code/hostlist.xml')
    doc, hosts = REXML::Document.new(xml), []
    doc.elements.each('hosts/host') do |element|
      uri = element.elements['uri'].text
      plugin_type = element.elements['type'].text
      hosts = eval("#{plugin_type}_query(#{uri})")
    end
  end
  
  def self.search(search_params)
    # create an hash to store temporary data per host
    hosts_info = Hash.new
    
    # read data stores directory
    xml = File.read('/Users/luisbrandao/Documents/GSoC10/code/hostlist.xml')
    doc, data_store_info = REXML::Document.new(xml), []
    
    # for each data store
    doc.elements.each('hosts/host') do |element|
      database_uri = element.elements['uri'].text
      database_plugin_type = element.elements['type'].text
      
      # query the data store and parse the returned XML
      #hosts = eval("#{database_plugin_type}_query(#{'database_uri'},#{'search_params'})")
      hosts = rest_query(database_uri, search_params)
      hosts_xml = REXML::Document.new(hosts)

      # each element is a different host, i.e a different URL
      hosts_xml.elements.each('hosts/host') do |host_properties|
        uri = host_properties.attributes['uri']
        hosts_info[uri] = Array.new if hosts_info[uri].nil?
        
        host_properties.elements.each do |host_property|
          property_name = host_property.name
          property_value = host_property.text
          hosts_info[uri] << HostProperty.new(database_uri, database_uri, property_name, property_value)
        end
      end  
    end
    
    # map URIs data to the Host class
    hosts_info.each do |host_uri, host_info|
      new(host_uri, host_info)
    end
  end

  def initialize(uri, uri_data)
    @uri = uri
    @uri_data = uri_data
  end
   
  def to_xml(options = {})
    #xml = options[:builder] ||= Builder::XmlMarkup.new(:indent => options[:indent])
    #xml.host { |b| b.id(@id); b.url(@url); b.label(@label); b.description(@description) }
=begin
    xml = options[:builder] ||= Builder::XmlMarkup.new(:indent => options[:indent])
    xml.host(:uri => @info[APP_CONFIG['uri_field_name']]) do
      field_names.each do |field|
        if field != APP_CONFIG['uri_field_name']
          eval("xml.#{field}(@info[field])")
        end
      end
    end
    xml
=end
  end
end