Stocks::Application.routes.draw do

  resources :companies do
    resources :financial_reports do
      collection do
        get 'annual'
        get 'quarterly'
      end
    end
    resources :cash_flow_statements
    resources :income_statements
    resources :balance_sheets
  end

  get "welcome/index"
  
  mount Resque::Server, :at => "/resque"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
#== Route Map
# Generated on 16 Jun 2012 12:59
#
# quarterly_company_financial_reports GET    /companies/:company_id/financial_reports/quarterly(.:format)   financial_reports#quarterly
#           company_financial_reports GET    /companies/:company_id/financial_reports(.:format)             financial_reports#index
#                                     POST   /companies/:company_id/financial_reports(.:format)             financial_reports#create
#        new_company_financial_report GET    /companies/:company_id/financial_reports/new(.:format)         financial_reports#new
#       edit_company_financial_report GET    /companies/:company_id/financial_reports/:id/edit(.:format)    financial_reports#edit
#            company_financial_report GET    /companies/:company_id/financial_reports/:id(.:format)         financial_reports#show
#                                     PUT    /companies/:company_id/financial_reports/:id(.:format)         financial_reports#update
#                                     DELETE /companies/:company_id/financial_reports/:id(.:format)         financial_reports#destroy
#        company_cash_flow_statements GET    /companies/:company_id/cash_flow_statements(.:format)          cash_flow_statements#index
#                                     POST   /companies/:company_id/cash_flow_statements(.:format)          cash_flow_statements#create
#     new_company_cash_flow_statement GET    /companies/:company_id/cash_flow_statements/new(.:format)      cash_flow_statements#new
#    edit_company_cash_flow_statement GET    /companies/:company_id/cash_flow_statements/:id/edit(.:format) cash_flow_statements#edit
#         company_cash_flow_statement GET    /companies/:company_id/cash_flow_statements/:id(.:format)      cash_flow_statements#show
#                                     PUT    /companies/:company_id/cash_flow_statements/:id(.:format)      cash_flow_statements#update
#                                     DELETE /companies/:company_id/cash_flow_statements/:id(.:format)      cash_flow_statements#destroy
#           company_income_statements GET    /companies/:company_id/income_statements(.:format)             income_statements#index
#                                     POST   /companies/:company_id/income_statements(.:format)             income_statements#create
#        new_company_income_statement GET    /companies/:company_id/income_statements/new(.:format)         income_statements#new
#       edit_company_income_statement GET    /companies/:company_id/income_statements/:id/edit(.:format)    income_statements#edit
#            company_income_statement GET    /companies/:company_id/income_statements/:id(.:format)         income_statements#show
#                                     PUT    /companies/:company_id/income_statements/:id(.:format)         income_statements#update
#                                     DELETE /companies/:company_id/income_statements/:id(.:format)         income_statements#destroy
#              company_balance_sheets GET    /companies/:company_id/balance_sheets(.:format)                balance_sheets#index
#                                     POST   /companies/:company_id/balance_sheets(.:format)                balance_sheets#create
#           new_company_balance_sheet GET    /companies/:company_id/balance_sheets/new(.:format)            balance_sheets#new
#          edit_company_balance_sheet GET    /companies/:company_id/balance_sheets/:id/edit(.:format)       balance_sheets#edit
#               company_balance_sheet GET    /companies/:company_id/balance_sheets/:id(.:format)            balance_sheets#show
#                                     PUT    /companies/:company_id/balance_sheets/:id(.:format)            balance_sheets#update
#                                     DELETE /companies/:company_id/balance_sheets/:id(.:format)            balance_sheets#destroy
#                           companies GET    /companies(.:format)                                           companies#index
#                                     POST   /companies(.:format)                                           companies#create
#                         new_company GET    /companies/new(.:format)                                       companies#new
#                        edit_company GET    /companies/:id/edit(.:format)                                  companies#edit
#                             company GET    /companies/:id(.:format)                                       companies#show
#                                     PUT    /companies/:id(.:format)                                       companies#update
#                                     DELETE /companies/:id(.:format)                                       companies#destroy
#                       welcome_index GET    /welcome/index(.:format)                                       welcome#index
#                       resque_server        /resque                                                        Resque::Server
#                                root        /                                                              welcome#index
