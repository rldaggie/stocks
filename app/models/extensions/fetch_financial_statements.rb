module Extensions
  module FetchFinancialStatements
    extend ActiveSupport::Concern
    
    include Extensions::FetchScraper
        
    def fetch_financial_statements_hash(period_type, period_ending, doc_hash)
      FinancialReport.statements_array.inject({}) do |the_hash, the_statement|
        the_statement = the_statement.to_s
        the_hash[the_statement] = fetch_financial_statement_hash(the_statement, period_type, period_ending, doc_hash)
        the_hash
      end
    end
    
    def fetch_financial_statement_hash(the_statement, period_type, period_ending, doc_hash)
      doc = doc_hash[period_type][the_statement]
      the_class = the_statement.camelize.constantize
      the_index = cell_index_for_period_ending(doc, period_ending)
      line_items_hash_for_statement(doc, the_class, the_index)
    end
  end
end