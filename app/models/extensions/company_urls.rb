module Extensions
  module CompanyUrls
    extend ActiveSupport::Concern
    
    module InstanceMethods
      def screen_scrape_urls_hash
        {
          'annual' => {
            'cash_flow_statement' => "http://investing.money.msn.com/investments/stock-cash-flow/?symbol=us%3A#{ticker}&stmtView=Ann",
            'income_statement' => "http://investing.money.msn.com/investments/stock-income-statement/?symbol=us%3A#{ticker}&stmtView=Ann",
            'balance_sheet' => "http://investing.money.msn.com/investments/stock-balance-sheet/?symbol=us%3A#{ticker}&stmtView=Ann"
          },
          'quarterly' => {
            'cash_flow_statement' => "http://investing.money.msn.com/investments/stock-cash-flow/?symbol=us%3A#{ticker}&stmtView=Qtr",
            'income_statement' => "http://investing.money.msn.com/investments/stock-income-statement/?symbol=us%3A#{ticker}&stmtView=Qtr",
            'balance_sheet' => "http://investing.money.msn.com/investments/stock-balance-sheet/?symbol=us%3A#{ticker}&stmtView=Qtr"
          }
        }
      end

      def details_url
        "http://investing.money.msn.com/investments/stock-price?Symbol=#{self.ticker}%2C&ocid=qbeb"
      end

      def screen_scrape_urls_array
        screen_scrape_urls_hash.values.inject([]) do |the_array, hash|
          the_array << hash.values
        end.flatten
      end
    end
  end
end