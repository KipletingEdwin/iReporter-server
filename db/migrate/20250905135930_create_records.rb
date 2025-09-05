class CreateRecords < ActiveRecord::Migration[8.0]
  def change
    create_table :records do |t|
      t.string :title
      t.string :description
      t.integer :record_type

      t.timestamps
    end
  end
end
