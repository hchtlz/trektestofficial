class TrekUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :name, :string
    add_column :users, :theme, :integer, default: 0, null: false
    add_column :users, :locale, :string
    add_column :users, :role, :integer, default: 1, null: false
  end
end
