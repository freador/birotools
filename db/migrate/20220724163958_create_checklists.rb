class CreateChecklists < ActiveRecord::Migration[7.0]
  def change
    create_table :checklists do |t|
      t.string :title
      t.string :example
      t.text :description
      t.string :category
      t.integer :impact
      t.integer :priority
      t.string :status
      t.string :evaluation
      t.references :app, null: false, foreign_key: true

      t.timestamps
    end
  end
end
