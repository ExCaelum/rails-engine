class Customer < ApplicationRecord
  has_many :invoices
  has_many :merchants, through: :invoices
  has_many :transactions, through: :invoices

  def favorite_merchant
    merchants.joins(invoices: :transactions).where(transactions: {result: "success"}).group(:id).order("COUNT(transactions) DESC").first
  end

end
