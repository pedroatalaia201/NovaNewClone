class ContentBuilderCountRead < ActiveRecord::Migration[5.0]
  def change
    create_table :content_builder_count_reads do |t|
      t.references :content_builder, index: true, foreign_key: true
      t.string :ip
      t.string :string

      t.timestamps null: false
    end
  end
end
