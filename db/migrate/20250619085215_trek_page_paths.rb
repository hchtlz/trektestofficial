class TrekPagePaths < ActiveRecord::Migration[8.0]
  def change
    create_table :page_paths do |t|
      t.references :page, null: false, foreign_key: true
      t.jsonb :path, default: {}

      t.timestamps
    end

    add_reference :pages, :current_path, null: true, foreign_key: { to_table: :page_paths }
  end
end
