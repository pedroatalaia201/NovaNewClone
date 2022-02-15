class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.string :title
      t.datetime :date_publish
      t.text :description
      t.string :link

      t.timestamps
    end
  end
end
