require "rexml/document"

class Host
   attr_reader :id
   attr_reader :url
   attr_reader :label
   attr_reader :description

   def self.all
     host_list = ActiveRecord::Base.connection.execute("select * " + APP_CONFIG['query_suffix'])

     hosts = Array.new
     host_list.each do |host_info|
       hosts.push([host_info[0], host_info[1], host_info[2], host_info[3]])
     end

     hosts.map { |host_info| new(host_info)}
   end

   def self.xmltest
     xml = File.read('/Users/luisbrandao/Documents/GSoC10/code/hostlist.xml')
     # to-do - validation? schema,dtd
     
     #read xml
     doc, hosts = REXML::Document.new(xml), []
     doc.elements.each('hosts/host') do |element|
        
       uri = element.elements['uri'].text
       type = element.elements['type'].text

       # get the data from each host
       
     end
   end
   
   def initialize(host_info)
     @id = host_info[0]
     @url = host_info[1]
     @label = host_info[2]
     @description = host_info[3]
   end
   
   def to_xml(options = {})
     xml = options[:builder] ||= Builder::XmlMarkup.new(:indent => options[:indent])
     xml.host { |b| b.id(@id); b.url(@url); b.label(@label); b.description(@description) }
   end
end
