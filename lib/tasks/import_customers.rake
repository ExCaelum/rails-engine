require 'csv'
namespace :import_customers do

  desc "Import Customers from CSV"
  task customers: :environment do
    counter = 0
    filename = File.join Rails.root, "/db/csv/customers.csv"
    CSV.foreach(filename, headers: true) do |row|
        customer = Customer.create(id: row["id"], first_name: row["first_name"], last_name: row["last_name"], created_at: row["created_at"], updated_at: row["updated_at"])
      puts "#{row["first_name"]}, #{row["last_name"]} - #{customer.errors.full_messages.join(", ")}" if customer.errors.any?
      counter += 1 if customer.persisted?
    end

    puts "Imported #{counter} customers"
  end
end
