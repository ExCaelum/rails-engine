class CreateInvoiceItems < ActiveRecord::Migration[5.0]
  def change
    create_table :invoice_items do |t|
      t.string :quantity
      t.integer :unit_price

      t.timestamps
    end
  end
end
