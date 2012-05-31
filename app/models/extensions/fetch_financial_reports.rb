module Extensions
  module FetchFinancialReports
    extend ActiveSupport::Concern
    
    include Extensions::FetchScraper
    include Extensions::FetchFinancialStatements
    
    def fetch_and_create_financial_reports
      self.financial_reports.create_from_array(fetch_financial_reports)
    end
    
    def fetch_financial_reports
      FinancialReport::PERIOD_TYPES.inject([]) do |the_array, period_type|
        fetch_periods_array_for_period_type(period_type).uniq.each do |period_ending|
          the_array << hash_for_period(period_type, period_ending)
        end
        the_array
      end
    end
    
    private
    
    def hash_for_period(period_type, period_ending)
      {
        :period_type => period_type,
        :period_ending => period_ending,
        :financial_statements => fetch_financial_statements(period_type, period_ending)
      }
    end
    
    def fetch_periods_array_for_period_type(period_type)
      self.screen_scrape_urls_hash[period_type].values.inject([]) do |the_array, url|
        the_array << fetch_periods_array_for_url(url)
        the_array
      end.flatten
    end
    
    def fetch_periods_array_for_url(url)
      doc = doc_for_url(url)
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