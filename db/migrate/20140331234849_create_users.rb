class CreateUsers < ActiveRecord::Migration
  def up
    create_table 'users' do |t|
      t.string   "name"
      t.string   "email"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "uid"
      t.string   "pubid"
      t.string   "provider"
      t.string   "oauth_token"
      t.datetime "oauth_expires_at"
    end
    add_index :users, :email, unique: true
  end
  
  def down
    drop_table 'users'
  end
end
