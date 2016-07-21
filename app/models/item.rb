class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def best_day
    invoice_items.joins(:invoice)
    .group("invoices.created_at")
    .order("sum_invoice_items_quantity DESC, invoices_created_at DESC")
    .sum("invoice_items.quantity").first.first
  end

  def self.most_items(amount)
    joins(:invoice_items).group(:id).order("COUNT(quantity) DESC").limit(amount)
  end

end
