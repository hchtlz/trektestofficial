class TrekPages < ActiveRecord::Migration[8.0]
  def change
    create_table :pages do |t|
      t.string :key, index: { unique: true }
      t.jsonb :slug, default: {}
      t.jsonb :title, default: {}
      t.jsonb :description, default: {}
      t.references :pageable, polymorphic: true
      t.integer :position, null: false
      t.references :parent, index: true
      t.jsonb :image_data
      t.jsonb :content
      t.boolean :versioned, default: false, null: false
      t.boolean :sectioned, default: false, null: false

      t.timestamps
    end
  end
end
