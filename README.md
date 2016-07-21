# Rails Engine
#### Colin Osborn & Parker Phillips
* Clone the project into a repository on your machine
* Run bundle on the project
* run `bundle exec rake db:setup`
* run `bundle exec rake import:data`     
You may want to grab a coffee, this will take approximately 2 and a half minutes. If you are having issues run these set of commands and try again.     
`bundle exec rake db:drop db:create db:setup`
* In order to run the tests enter this in the console. `cd rales_engine_spec_harness` then type `rake`
* In order to run the server type this in the console `rails s`. Once you've done that you can visit these paths to see data.     
*- The root of the routes is http://localhost:3000/api/v1


     * /items/find
     * /items/find_all
     * /items/random
     * /items/most_items
     * /items/most_revenue
     * /items/:id/invoice_items
     * /items/:id/merchant
     * /items/:id/best_day     

     * /invoice_items/find
     * /invoice_items/find_all
     * /invoice_items/random
     * /invoice_items/:id/invoice
     * /invoice_items/:id/item     


     * /invoices/find
     * /invoices/find_all
     * /invoices/random
     * /invoices/:id/transactions
     * /invoices/:id/invoice_items
     * /invoices/:id/items
     * /invoices/:id/customer
     * /invoices/:id/merchant     


     * /merchants/find
     * /merchants/find_all
     * /merchants/random
     * /merchants/revenue
     * /merchants/most_revenue
     * /merchants/most_items
     * /merchants/:id/items
     * /merchants/:id/invoices
     * /merchants/:id/customers_with_pending_invoices
     * /merchants/:id/favorite_customer
     * /merchants/:id/revenue     


     * /transactions/find
     * /transactions/find_all
     * /transactions/random
     * /transactions/:id/invoice     


     * /customers/find
     * /customers/find_all
     * /customers/random
     * /customers/:id/invoices
     * /customers/:id/transactions
     * /customers/:id/favorite_merchant
