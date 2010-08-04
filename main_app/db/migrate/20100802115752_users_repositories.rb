class UsersRepositories < ActiveRecord::Migration
  def self.up
    create_table :repositories_users, :id => false do |t|
      t.references :repository, :user
    end
  end

  def self.down
    drop_table :repositories_users
  end
end
