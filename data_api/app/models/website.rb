class Website < ActiveRecord::Base
  def self.get_all_websites
    sel = ActiveRecord::Base.connection.execute("select * " + APP_CONFIG['query_suffix'])
    logger.debug "The object is #{sel[0].type()}"
    
    hosts = Array.new
    
    sel.each do |key|
      temp = Host.new
      #logger.debug "#{key.class()}"
      #logger.debug "#{key[0]} | #{key[1]} | #{key[2]}"
      hosts.push(key[0])
    end
    
    return hosts
  end
  
  def self.get_website
    #result = ActiveRecord::Base.connection.execute(APP_CONFIG['query'])
    #name = result.first
  end
end
