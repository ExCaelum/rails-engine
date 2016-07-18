require 'csv'
namespace :import_items do

  desc "Import Items from CSV"
  task items: :environment do
    filename = File.join Rails.root, "/db/csv/items.csv"
    CSV.foreach(filename, :headers: true) do |row|
      item = Item.create(id: row["id"],
                          name: row["name"],
                          description: row["description"],
                          unit_price: row["unit_price"],
                          merchant_id: row["merchant_id"],
                          created_at: row["created_at"],
                          updated_at: row["updated_at"])
      puts "#{item.full_messages.join(", ")}" if item.erros.any?
      counter += 1 if item.persisted?
    end

    puts "Imported #{counter} Items"
  end
end
