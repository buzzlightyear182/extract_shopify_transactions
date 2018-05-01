class HomeController < ShopifyApp::AuthenticatedController
  def index
    @orders = ShopifyAPI::Order.new(created_at_min: nil, created_at_max: nil)
  end

  def display_results
    beginning_date = DateTime.parse("#{params["shopify_api_order"]["created_at_min"]} 00:00:00 +0800")
    ending_date = DateTime.parse("#{params["shopify_api_order"]["created_at_max"]} 00:00:00 +0800")
  	@orders = ShopifyAPI::Order.where(created_at_min: beginning_date, created_at_max: ending_date, status: "closed", limit: 250, gateway: "stripe")
  	render 'display_results'
  end

  private 

  def order_filter_params
  	params.require(:orders).permit(:created_at_min, :created_at_max, :status)
  end
end
