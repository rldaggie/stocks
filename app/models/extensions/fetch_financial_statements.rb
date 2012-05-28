module Extensions
  module FetchFinancialStatements
    extend ActiveSupport::Concern
    
    include Extensions::FetchScraper
    
    module InstanceMethods
      def fetch_financial_statements(period_type, period_ending)
        the_hash = fetched_financial_statements_hash(period_type, period_ending)
        
      end
      
      def fetched_financial_statements_hash(period_type, period_ending)
        ['cash_flow_statement', 'balance_sheet'].inject({}) do |the_hash, the_statement|
          the_hash[the_statement] = fetched_financial_statement_hash(the_statement, period_type, period_ending)
          the_hash
        end
      end
      
      def fetched_financial_statement_hash(the_statement, period_type, period_ending)
        url = self.screen_scrape_urls_hash[period_type][the_statement]
        the_class = the_statement.camelize.constantize
        the_index = cell_index_for_period_type(url, period_ending)
        line_items_hash_for_statement(url, the_class, the_index)
      end
    end
  end
end