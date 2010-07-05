class CreateWebsites < ActiveRecord::Migration
  def self.up
    create_table :websites do |t|
      t.string  :name
      t.string  :label
      t.text  :value
    end
  end

  def self.down
    drop_table :websites
  end
end
