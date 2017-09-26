class CreateEconomicEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :economic_events do |t|
      t.string :name, limit: 300
      t.string :alt_name, limit: 300
      t.text :description
      t.integer :impact
      t.string :currency, limit: 3

      t.timestamps
    end
    add_index :economic_events, :name, unique: true
    add_index :economic_events, [:currency, :impact]
  end
end
