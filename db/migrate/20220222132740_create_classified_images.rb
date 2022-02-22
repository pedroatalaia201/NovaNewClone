class CreateClassifiedImages < ActiveRecord::Migration[5.0]
  def change
    create_table :classified_images do |t|
      t.string :image
      t.references :classified, index: true, foreign_key: true

      t.timestamps
    end
  end
end
