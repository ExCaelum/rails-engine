class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices

  def self.total_revenue_by_date(date)
    total = successful_transactions.where(invoices: {created_at: "#{date}"})
    .sum("invoice_items.quantity * invoice_items.unit_price").to_d / 100
    revenue = total.truncate.to_s + '.' + sprintf('%02d', (total.frac * 100).truncate)
    {"total_revenue" => revenue}
  end

  def self.most_revenue_by_quantity(quantity)
    quantity = quantity.to_i
    total = successful_transactions.group(:id).order("sum(invoice_items.quantity * invoice_items.unit_price) DESC")
    .group(:id).limit("#{quantity}")
  end

  def customers_with_pending_invoices
    Customer.find(invoices.joins(:transactions)
    .where(transactions: {result: "failed"})
    .joins(:customer).pluck(:customer_id).uniq)
  end

  def favorite_customer
    customers.joins(invoices: :transactions).where(transactions: {result: "success"}).group(:id).order("COUNT(transactions) DESC").first
  end

  def revenue
    invoices.joins(:transactions, :invoice_items).where(transactions: {result: "success"}).sum("invoice_items.quantity * invoice_items.unit_price")
  end

  def revenue_by_date(date)
    revenue = invoices.joins(:transactions, :invoice_items).where(transactions: {result: "success"}).where(invoices: {created_at: "#{date}"}).sum("invoice_items.quantity * invoice_items.unit_price").to_d / 100
    formatted_revenue = revenue.truncate.to_s + '.' + sprintf('%02d', (revenue.frac * 100).truncate)
    {revenue: formatted_revenue}
  end

  def self.most_items(amount)
    successful_transactions.group(:id).order("SUM(invoice_items.quantity) DESC").limit(amount)
  end

  private

  def self.successful_transactions
    joins(invoices: [:transactions, :invoice_items])
    .where(transactions: {result: "success"})
  end
end
