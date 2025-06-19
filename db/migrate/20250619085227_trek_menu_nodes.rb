class TrekMenuNodes < ActiveRecord::Migration[8.0]
  def change
    create_table "menu_nodes", force: :cascade do |t|
      t.string "key"
      t.jsonb "title", default: {}
      t.jsonb "label", default: {}
      t.integer "position", null: false
      t.bigint "parent_id"
      t.string "linkable_type"
      t.bigint "linkable_id"
      t.string "icon_key"
      t.string "modifiers"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["linkable_type", "linkable_id"], name: "index_menu_nodes_on_linkable"
      t.index ["key", "parent_id"], name: "index_menu_nodes_on_key_and_parent_id", unique: true
      t.index ["parent_id"], name: "index_menu_nodes_on_parent_id"
    end
  end
end
