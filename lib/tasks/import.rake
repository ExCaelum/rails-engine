require 'csv'
namespace :import do

  desc "Import Users from CSV"
  task users: :environment do
    filename = File.join Rails.root, "/db/csv/*"
    CSV.foreach(filename, headers: true) do |row|
      user = User.create(name: row["name"], email: row["email"])
      puts "#{row["email"]} - #{user.errors.full_messages.join(", ")}" if user.errors.any?
      counter += 1 if user.persisted?
    end

    puts "Imported #{counter} users"
  end
end
