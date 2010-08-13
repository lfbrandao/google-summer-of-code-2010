class CreatePluginDefinitions < ActiveRecord::Migration
  def self.up
    create_table :plugindefinitions do |t|
      t.integer :plugin_id
      t.string :field_name
      t.string :field_data_type
      t.string :field_visual_type

      t.timestamps
    end
  end

  def self.down
    drop_table :plugindefinitions
  end
end
