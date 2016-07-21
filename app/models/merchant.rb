class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  def self.total_revenue_by_date(date)
    total = joins(invoices: [:transactions, :invoice_items])
    .where(transactions: {result: "success"})
    .where(invoices: {created_at: "#{date}"})
    .sum("invoice_items.quantity * invoice_items.unit_price").to_d / 100
    revenue = total.truncate.to_s + '.' + sprintf('%02d', (total.frac * 100).truncate)
    {"total_revenue" => revenue}
  end

  def self.most_revenue_by_quantity()

  end

  private

  def self.successful_transactions
    joins.(invoices: [:transactions, :invoice_items])
    .where(transactions: {result: "success"})
  end
end
