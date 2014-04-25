class RemoveGraphUserFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :fb_graph, :string
  end
end
