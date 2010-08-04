class RolesRepositories < ActiveRecord::Migration
  def self.up
    create_table :repositories_roles, :id => false do |t|
      t.references :repository, :role
    end
  end

  def self.down
    drop_table :repositories_roles
  end
end
