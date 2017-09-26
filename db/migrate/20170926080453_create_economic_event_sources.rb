class CreateEconomicEventSources < ActiveRecord::Migration[5.1]
  def change
    create_table :economic_event_sources do |t|
      t.references :economic_event, foreign_key: true
      t.string :url_path, limit: 2000
      t.integer :priority

      t.timestamps
    end
  end
end
