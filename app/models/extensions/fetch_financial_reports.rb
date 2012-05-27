module Extensions
  module FetchFinancialReports
    extend ActiveSupport::Concern
    
    include Extensions::FetchScraper
    include Extensions::FetchFinancialStatements
    
    module InstanceMethods
      def fetch_financial_reports
        the_array = fetched_financial_reports_array
        # self.financial_reports.create_from_array(the_array)
      end
      
      def fetched_financial_reports_array
        FinancialReport::PERIOD_TYPES.inject([]) do |the_array, period_type|
          fetched_periods_array_for_period_type(period_type).uniq.each do |period_ending|
            the_array << hash_for_period(period_type, period_ending)
          end
          the_array
        end
      end
      
      def hash_for_period(period_type, period_ending)
        {
          :period_type => period_type,
          :period_ending => period_ending,
          :financial_statements => fetch_financial_statements(period_type, period_ending)
        }
      end
      
      private
      
      def fetched_periods_array_for_period_type(period_type)
        self.screen_scrape_urls_hash[period_type].values.inject([]) do |the_array, url|
          the_array << fetched_periods_array_for_url(url)
          the_array
        end.flatten
      end
      
      def fetched_periods_array_for_url(url)
        doc = doc_for_url(url)
        table_cells = cell_values_from_row(doc, period_dom_id)
      end
    end
  end
end