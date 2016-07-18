require 'csv'
namespace :import_ do

  desc "Import Merchants from CSV"
  task merchants: :environment do
    filename = File.join Rails.root, "/db/csv/merchants.csv"
    CSV.foreach(filename, headers: true) do |row|
      merchants = Merchants.create(id: row["id"],
                                   name: row["name"],
                                   created_at: row["created_at"],
                                   updated_at: row["updated_at"])
      puts "#{merchants.full_messages.join(", ")}" if merchants.errors.any?
      counter += 1 if merchants.persisted?
    end

    puts "Imported #{counter} Merchants"
  end
end
