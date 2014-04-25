class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.text :members

      t.timestamps
    end
    add_index :groups
  end
end
