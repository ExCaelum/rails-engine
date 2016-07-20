class Customer < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices


  def transactions
    trans = []
    transactions = Transaction.joins(:invoice)
    self.invoices.each do |invoice|
      trans << transactions.where(invoice_id: invoice.id)
    end
    trans
  end

end
