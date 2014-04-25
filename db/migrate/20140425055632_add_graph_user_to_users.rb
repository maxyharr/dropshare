class AddGraphUserToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fb_graph, :string
  end
end
