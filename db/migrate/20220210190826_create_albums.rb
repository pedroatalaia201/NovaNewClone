class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.string :name
      t.string :description
      t.string :slug
      t.boolean :status
      t.datetime :date_publish

      t.timestamps
    end
  end
end
