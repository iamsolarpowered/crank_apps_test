class AddFacebookDataToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :bio, :text
    add_column :users, :name, :string
    add_column :users, :facebook_uid, :string
  end

  def self.down
    remove_column :users, :bio
    remove_column :users, :name
    remove_column :users, :facebook_uid
  end
end
