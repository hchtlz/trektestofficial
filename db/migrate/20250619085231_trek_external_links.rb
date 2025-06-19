class TrekExternalLinks < ActiveRecord::Migration[8.0]
  def change
    create_table :external_links do |t|
      t.string :key
      t.string :url, null: false

      t.timestamps
    end

    add_index :external_links, :key, unique: true
  end
end
