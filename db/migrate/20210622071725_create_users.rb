class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :nick_name
      t.datetime :birthday
      t.string :user_adress
      t.string :email
      t.string :password_digest
      t.integer :user_gender

      t.timestamps
    end
  end
end
