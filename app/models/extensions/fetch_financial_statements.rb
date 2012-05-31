module Extensions
  module FetchFinancialStatements
    extend ActiveSupport::Concern
    
    include Extensions::FetchScraper
    
    def fetch_financial_statements(period_type, period_ending, doc_hash)
      the_hash = fetch_financial_statements_hash(period_type, period_ending, doc_hash)
    end
    
    def fetch_financial_statements_hash(period_type, period_ending, doc_hash)
      ['cash_flow_statement', 'balance_sheet', 'income_statement'].inject({}) do |the_hash, the_statement|
        the_hash[the_statement] = fetch_financial_statement_hash(the_statement, period_type, period_ending, doc_hash)
        the_hash
      end
    end
    
    def fetch_financial_statement_hash(the_statement, period_type, period_ending, doc_hash)
      doc = doc_hash[period_type][the_statement]
      the_class = the_statement.camelize.constantize
      the_index = cell_index_for_period_type(doc, period_ending)
      line_items_hash_for_statement(doc, the_class, the_index)
    end
  end
end