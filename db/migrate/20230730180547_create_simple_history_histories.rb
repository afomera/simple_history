class CreateSimpleHistoryHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :simple_history_histories do |t|
      t.references :record, polymorphic: true, null: false
      t.references :user, polymorphic: true, null: true
      t.string :action
      t.text :changed_data

      t.timestamps
    end
  end
end
