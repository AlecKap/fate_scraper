class CreateCatPics < ActiveRecord::Migration[5.2]
  def change
    create_table :cat_pics do |t|
      t.string :url

      t.timestamps
    end
  end
end
