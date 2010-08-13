class ChangeRepositoryColumnNameAndType < ActiveRecord::Migration
  def self.up
    change_column :repositories, :plugin_type, :integer
    rename_column :repositories, :plugin_type, :plugin_id
  end

  def self.down
    change_column :repositories, :plugin_type, :string
    rename_column :repositories, :plugin_id, :plugin_type
  end
end
