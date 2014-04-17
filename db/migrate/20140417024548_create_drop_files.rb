class CreateDropFiles < ActiveRecord::Migration
  def change
    create_table :drop_files do |t|
      t.string :name
      t.string :attachment

      t.timestamps
    end
  end
end
