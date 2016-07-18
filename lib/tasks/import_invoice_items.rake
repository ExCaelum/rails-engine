require 'csv'
namespace :import_invoice_items do

  desc "Import Invoice_items from CSV"
  task invoice_items: :environment do
    filename = File.join Rails.root, "/db/csv/invoice_items.csv"
    CSV.foreach(filename, headers: true) do |row|
      invoice_item = InvoiceItem.create(id: row["id"],
                                        item_id: row["item_id"],
                                        invoice_id: row["invoice_id"],
                                        quantity: row["quantity"],
                                        unit_price: row["unit_price"],
                                        created_at: row["created_at"],
                                        updated_at: row["updated_at"])
      puts "#{invoice_item.errors.full_messages.join(", ")}" if invoice_item.errors.any?
      counter += 1 if invoice_item.persisted?
    end

    puts "Imported #{counter} invoice_items"
  end
end
