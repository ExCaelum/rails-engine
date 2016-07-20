class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  private

  def self.successful_transactions

  end
end
