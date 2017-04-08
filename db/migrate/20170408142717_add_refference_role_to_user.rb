class AddRefferenceRoleToUser < ActiveRecord::Migration
  def self.up
  	add_reference :users, :role, index: true
  end

  def self.down
  	remove_reference :users, :role	
  end
end
