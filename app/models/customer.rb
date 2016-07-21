class Customer < ApplicationRecord
  has_many :invoices
  has_many :merchants, through: :invoices


  def transactions
    trans =[]
    self.invoices.each do |invoice|
      invoice.transactions.each do |transaction|
        trans << transaction
      end
    end
    trans
  end

  def favorite_merchant
    merchants.joins(invoices: :transactions).where(transactions: {result: "success"}).group(:id).order("COUNT(transactions) DESC").first
  end

end
