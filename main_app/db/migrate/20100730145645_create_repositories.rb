class CreateRepositories < ActiveRecord::Migration
  def self.up
    create_table :repositories do |t|
      t.string :name
      t.string :uri
      t.string :path
      t.string :type
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :repositories
  end
end
