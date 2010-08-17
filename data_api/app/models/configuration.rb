class Configuration < ActiveRecord::Base
  establish_connection "configuration_#{RAILS_ENV}"
  
  validate :sanitize_sql
  
  def sanitize_sql
    if query_base.downcase.include? 'update' or query_base.downcase.include? 'delete'  
      errors.add(:query_base, "cannot include the words delete, update") 
    end
    if query_where.downcase.include? 'update' or query_where.downcase.include? 'delete'  
      errors.add(:query_where, "cannot include the words delete, update") 
    end
  end
end
