require 'csv'
namespace :import do

  desc "Import data from CSVs"
  task data: :environment do
    Rake::Task['import_customers:customers'].invoke
    Rake::Task['import_merchants:merchants'].invoke
    Rake::Task['import_items:items'].invoke
    Rake::Task['import_invoices:invoices'].invoke
    Rake::Task['import_invoice_items:invoice_items'].invoke
    Rake::Task['import_transactions:transactions'].invoke
  end
end
