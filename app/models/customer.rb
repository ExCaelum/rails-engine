class Customer < ApplicationRecord
  has_many :invoices


  def transactions
    trans =[]
    self.invoices.each do |invoice|
      invoice.transactions.each do |transaction|
        trans << transaction
      end
    end
    trans
  end
  
  # def transactions
  #   trans = []
  #   transactions = Transaction.joins(:invoice)
  #   self.invoices.each do |invoice|
  #     trans << transactions.where(invoice_id: invoice.id)
  #   end
  #   trans
  # end

end
