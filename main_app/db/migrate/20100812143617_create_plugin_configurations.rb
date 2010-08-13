class CreatePluginConfigurations < ActiveRecord::Migration
  def self.up
    create_table :pluginconfigurations do |t|
      t.integer :plugin_id
      t.integer :plugin_description_id
      t.integer :repository_id
      t.string :field_value

      t.timestamps
    end
  end

  def self.down
      drop_table :pluginconfigurations
  end
end
