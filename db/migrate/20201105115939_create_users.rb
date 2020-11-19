class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|

      t.timestamps
      t.string :nickname,           null: false
      t.string :encrypted_password, null: false, default: ""
      t.string :email,              null: false, default: ""
      t.string :name,               null: false
      t.string :last_name,          null: false
      t.string :kana_name,          null: false
      t.string :kana_last_name,     null: false
      t.date :birthday,           null: false
    end
    #add_index :users, :email,                unique: true
    #add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end