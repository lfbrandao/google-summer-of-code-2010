class AddUserAndPasswordColumnsToRepositories < ActiveRecord::Migration
  def self.up
    add_column :repositories, :username, :string
    add_column :repositories, :password, :string
  end

  def self.down
    remove_column :repositories, :username
    remove_column :repositories, :password
  end
end
