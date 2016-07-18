require 'csv'
namespace :import_merchants do

  desc "Import Merchants from CSV"
  task merchants: :environment do
    counter = 0
    filename = File.join Rails.root, "/db/csv/merchants.csv"
    CSV.foreach(filename, headers: true) do |row|
      merchant = Merchant.create(id: row["id"],
                                   name: row["name"],
                                   created_at: row["created_at"],
                                   updated_at: row["updated_at"])
      puts "#{merchant.full_messages.join(", ")}" if merchant.errors.any?
      counter += 1 if merchant.persisted?
    end

    puts "Imported #{counter} Merchants"
  end
end
