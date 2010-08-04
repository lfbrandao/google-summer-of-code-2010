class RenameRepositoryTypeColumn < ActiveRecord::Migration
  def self.up
    rename_column :repositories, :type, :plugin_type
  end

  def self.down
  end
end
