class CreateClassifieds < ActiveRecord::Migration[5.0]
  def change
    create_table :classifieds do |t|
      t.string :title
      t.decimal :price
      t.string :name
      t.string :phone
      t.string :email
      t.text :description
      t.string :slug

      t.timestamps
    end
  end
end
