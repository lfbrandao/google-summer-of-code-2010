class Host
  attr_reader :id
  attr_reader :name
  attr_reader :label
  attr_reader :value
  
  def self.get_all_websites
    host_list = ActiveRecord::Base.connection.execute("select * " + APP_CONFIG['query_suffix'])

    hosts = Array.new
    host_list.each do |host_info|
      hosts.push([host_info[0], host_info[1], host_info[2], host_info[3]])
    end
    
    hosts.map { |host_info| new(host_info)}
  end
  
  def initialize(host_info)
    @id = host_info[0]
    @name = host_info[1]
    @label = host_info[2]
    @value = host_info[3]
  end
end
