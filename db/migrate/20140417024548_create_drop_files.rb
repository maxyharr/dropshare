class CreateDropFiles < ActiveRecord::Migration
  def change
    create_table :drop_files do |t|
      t.string :name
      t.string :attachment
      #t.integer :user_id
      t.timestamps
    end
    #add_index :drop_files, [:user_id, :created_at]
  end
end
