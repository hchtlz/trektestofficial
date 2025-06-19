class TrekFragments < ActiveRecord::Migration[8.0]
  def change
    create_table :fragments do |t|
      t.string :key, index: true
      t.string :namespace, index: true
      t.integer :position, null: false
      t.jsonb :title, default: {}
      t.jsonb :content

      t.timestamps

      t.index %i[key namespace], unique: true
    end
  end
end
