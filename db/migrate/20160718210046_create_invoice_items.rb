class CreateInvoiceItems < ActiveRecord::Migration[5.0]
  def change
    create_table :invoice_items do |t|
      t.references :item_id, foreign_key: true
      t.references :invoice_id, foreign_key: true
      t.string :quantity
      t.integer :unit_price

      t.timestamps
    end
  end
end
