require 'csv'
namespace :import_transactions do

  desc "Import Transactions from CSV"
  task transactions: :environment do
    filename = File.join Rails.root, "/db/csv/transactions.csv"
    CSV.foreach(filename, headers: true) do |row|
      transaction = Transaction.create(id: row["id"],
                                       invoice_id: row["invoice_id"],
                                       credit_card_number: row["credit_card_number"],
                                       credit_card_expiration_date: row["credit_card_expiration_date"],
                                       result: row["result"],
                                       created_at: row["created_at"],
                                       updated_at: row["updated_at"])
      puts "#{transaction.full_messages.join(", ")}" if transaction.errors.any?
      counter += 1 if transaction.persisted?
    end

    puts "Imported #{counter} Transactions"
  end
end
