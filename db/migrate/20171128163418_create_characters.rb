class CreateCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.text :description
      t.text :thoughts


      t.timestamps
    end
  end
end
