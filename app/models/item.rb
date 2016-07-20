class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def best_day
    day = invoice_items.joins(:invoice)
    .group("invoices.created_at")
    .order("sum_invoice_items_quantity DESC, invoices_created_at DESC")
    .sum("invoice_items.quantity").first.first
    {"best_day" => day}
  end

end
