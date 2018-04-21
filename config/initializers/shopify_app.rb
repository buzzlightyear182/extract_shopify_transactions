ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = "de485307c6e8eb6a14d31501bb795d8c"
  config.secret = "10a73b6fa5fba8a9c1acefc85727adbc"
  config.scope = "read_orders, read_products"
  config.embedded_app = true
  config.after_authenticate_job = false
  config.session_repository = Shop
end
