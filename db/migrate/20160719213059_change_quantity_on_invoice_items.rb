class ChangeQuantityOnInvoiceItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :invoice_items, :quantity
    add_column :invoice_items, :quantity, :integer
  end
end
