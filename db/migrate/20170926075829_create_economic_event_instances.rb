class CreateEconomicEventInstances < ActiveRecord::Migration[5.1]
  def change
    create_table :economic_event_instances do |t|
      t.references :economic_event, foreign_key: true
      t.datetime :released
      t.boolean :preliminary
      t.float :actual
      t.float :forecast
      t.float :previous

      t.timestamps
    end
  end
end
