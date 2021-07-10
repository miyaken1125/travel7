class AddImageNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_colomn :users, :image_name, : string
 
  end
end
