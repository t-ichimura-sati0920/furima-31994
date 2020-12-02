class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name,           null: false
      t.integer  :price,           null: false
      t.text  :description
      t.integer  :status_id,           null: false
      t.string  :size
      t.integer  :cost_id,           null: false
      t.integer  :days_id,           null: false
      t.integer  :category_id,           null: false
      t.string  :brand
      t.integer  :prefacture_id,           null: false
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
