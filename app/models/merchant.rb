class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  def self.revenue_by_date
    joins(invoices: [:transactions, :invoice_items])
    .where(transactions: {result: "success"})
    .where(invoices: {created_at: "2012-03-16 11:55:05"})
    .sum("invoice_items.quantity * invoice_items.unit_price")
  end

  private

  def self.successful_transactions
    joins.(invoices: [:transactions, :invoice_items])
    .where(transactions: {result: "success"})
  end
end
