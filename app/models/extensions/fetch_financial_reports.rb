module Extensions
  module FetchFinancialReports
    extend ActiveSupport::Concern
    
    include Extensions::FetchScraper
    include Extensions::FetchFinancialStatements
    
    def fetch_and_create_financial_reports
      self.financial_reports.create_from_array(fetch_financial_reports)
    end
    
    def fetch_financial_reports
      doc_hash = screen_scrape_doc_hash      
      FinancialReport::PERIOD_TYPES.inject([]) do |the_array, period_type|
        fetch_periods_array_for_period_type(period_type, doc_hash).uniq.each do |period_ending|
          the_array << hash_for_period(period_type, period_ending, doc_hash)
        end
        the_array
      end
    end
    
    private
    
    def hash_for_period(period_type, period_ending, doc_hash)
      {
        :period_type => period_type,
        :period_ending => period_ending,
        :financial_statements => fetch_financial_statements_hash(period_type, period_ending, doc_hash)
      }
    end
    
    def screen_scrape_doc_hash
      screen_scrape_urls_hash.keys.inject({}) do |the_hash, period_type|
        the_hash[period_type] = screen_scrape_urls_hash[period_type].keys.inject({}) do |statement_hash, statement|
          statement_hash[statement] = doc_for_url(screen_scrape_urls_hash[period_type][statement])
          statement_hash
        end
        the_hash
      end
    end
        
    def fetch_periods_array_for_period_type(period_type, doc_hash)
      doc_hash[period_type].values.map do |doc|
        fetch_periods_array_for_doc(doc)
      end.flatten
    end
    
    def fetch_periods_array_for_doc(doc)
      table_cells = cell_values_from_row(doc, period_dom_id)
      valid_periods_array(table_cells)
    end
    
    def valid_periods_array(periods)
      periods.map do |period|
        begin
          Date.strptime(period, "%m/%d/%Y")
        rescue
          nil
        else
          period
        end
      end.compact
    end
  end
end