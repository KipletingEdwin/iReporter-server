class CreateReports < ActiveRecord::Migration[8.0]
  def change
    create_table :reports do |t|
      t.string :title
      t.text :description
      t.string :category
      t.string :location
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
