class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :restaurant_name
      t.string :description
      t.string :image_url

      t.timestamps
    end
  end
end
