class ContentBuilderArchives < ActiveRecord::Migration[5.0]
  def change
    create_table :content_builder_archives do |t|
      t.string :name
      t.string :file
      t.references :content_builder, index: true, foreign_key: true

      t.timestamps
    end
  end
end
