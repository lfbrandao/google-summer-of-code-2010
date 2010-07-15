class Host < ActiveRecord::Base
  def self.columns
    @columns ||= [];
  end

  def self.column(name, sql_type = nil, default = nil, null = true)
    columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
  end

  column :id, :string
  column :url, :string
  column :label, :string
  column :description, :string
  set_primary_key :id         

  
  def self.all
    host_list = ActiveRecord::Base.connection.execute("select * from websites")
    id = Array.new
    url = Array.new
    label = Array.new
    description = Array.new
    #hosts = Array.new
    
    host_list.each do |host_info|
       puts host_info[0].class
       #hosts.push(['host_info[0]', 'host_info[1]', 'host_info[2]', 'host_info[3]'])
       id.push(host_info[0])
       url.push(host_info[1])
       label.push(host_info[2])
       description.push(host_info[3])
     end

     #hosts.map { |host_info| new(host_info)}
  end

   def self.xmltest
      xml = File.read('/Users/luisbrandao/Documents/GSoC10/code/hostlist.xml')
      # to-do - validation? schema,dtd
      require "rexml/document"
      #read xml
      doc, hosts = REXML::Document.new(xml), []
      doc.elements.each('hosts/host') do |element|
        uri = element.elements['uri'].text
        hosts = rest_query(uri)
      end
      hosts
   end
   
   #def initialize(host_info)
  #   id = host_info[0][0]
  #   url = host_info[0][1]
  #   label = host_info[0][2]
  #   description = host_info[0][3]
  # end
end
