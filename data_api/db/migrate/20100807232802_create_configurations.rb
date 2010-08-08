class CreateConfigurations < ActiveRecord::Migration
  def self.up
    create_table :configurations do |t|
      t.string :query_base
      t.string :query_where
      t.string :data_field_names
      t.string :data_field_friendly_name
      t.string :filter_field_name
      t.string :user_name
      t.string :password

      t.timestamps
    end
  end

  def self.down
    drop_table :configurations
  end
end
