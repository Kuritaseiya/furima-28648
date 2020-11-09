class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|

      t.timestamps
      t.string :nickname,           null: false
      t.string :encrypted_password, null: false
      t.string :encrypted_password2, null: false
      t.string :email,              null: false
      t.string :name,               null: false
      t.string :last_name,          null: false
      t.string :KANA_name,          null: false
      t.string :KANA_last_name,     null: false
      t.string :birthday,           null: false
    end
  end
end