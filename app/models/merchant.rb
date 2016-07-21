class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  def revenue
    invoices.joins(:transactions, :invoice_items).where(transactions: {result: "success"}).sum("invoice_items.quantity * invoice_items.unit_price")
  end

  def revenue_by_date(date)
    revenue = invoices.joins(:transactions, :invoice_items).where(transactions: {result: "success"}).where(invoices: {created_at: "#{date}"}).sum("invoice_items.quantity * invoice_items.unit_price").to_d / 100
    formatted_revenue = revenue.truncate.to_s + '.' + sprintf('%02d', (revenue.frac * 100).truncate)
    {revenue: formatted_revenue}
  end


  private

  def self.successful_transactions
    joins(invoices: [:transactions, :invoice_items]).where(transactions: {result: "success"})
  end
end

# invoices.joins(:transactions, :invoice_items).where(transactions: {result: "success"}).where(invoices: {created_at: "2012-03-16 11:55:05"}).sum("invoice_items.quantity * invoice_items.unit_price")
