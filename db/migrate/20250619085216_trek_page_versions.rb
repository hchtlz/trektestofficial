class TrekPageVersions < ActiveRecord::Migration[8.0]
  def change
    create_table :page_versions do |t|
      t.references :page, null: false, foreign_key: true
      t.string :name, null: false
      t.jsonb :content
      t.jsonb :image_data
      t.datetime :current_since

      t.timestamps
    end
  end
end
