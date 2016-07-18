require 'csv'
namespace :import_invoices do

  desc "Import invoices from CSV"
  task invoices: :environment do
    filename = File.join Rails.root, "/db/csv/invoices.csv"
    CSV.foreach(filename, headers: true) do |row|
      invoice = Invoice.create(id: row["id"],
                               customer_id: row["customer_id"],
                               merchant_id: row["merchant_id"],
                               status: row["status"],
                               created_at: row["created_at"],
                               updated_at: row["updated_at"])
      puts "#{invoice.errors.full_messages.join(", ")}" if invoice.errors.any?
      counter += 1 if invoice.persisted?
    end

    puts "Imported #{counter} invoices"
  end
end
