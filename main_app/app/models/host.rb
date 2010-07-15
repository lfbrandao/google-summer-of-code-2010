require "rexml/document"

class Host
   attr_reader :id
   attr_reader :url
   attr_reader :label
   attr_reader :description

   def self.all
     host_list = ActiveRecord::Base.connection.execute("select * from websites")

     hosts = Array.new
     host_list.each do |host_info|
       hosts.push([host_info[0], host_info[1], host_info[2], host_info[3]])
     end

     hosts.map { |host_info| new(host_info)}
   end

   def self.xmltest
     xml = File.read('/Users/luisbrandao/Documents/GSoC10/code/hostlist.xml')
     # to-do - validation? schema,dtd
     doc, hosts = REXML::Document.new(xml), []
     doc.elements.each('hosts/host') do |element|
         uri = element.elements['uri'].text
         host_info = rest_query(uri)
         hosts.map { |host_info| new(host_info)}
         #query = element.elements['query'].text
     end
   end
   
   def self.xmlsmalltest
     hosts = rest_query('http://0.0.0.0:3000/hosts.xml')
     puts hosts.inspect
     hosts.map { |host_info| new(host_info)}
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
