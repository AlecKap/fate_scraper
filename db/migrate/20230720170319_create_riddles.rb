class CreateRiddles < ActiveRecord::Migration[5.2]
  def change
    create_table :riddles do |t|
      t.string :title
      t.string :question
      t.string :answer

      t.timestamps
    end
  end
end
