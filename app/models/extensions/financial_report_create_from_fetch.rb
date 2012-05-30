module Extensions
  module FinancialReportCreateFromFetch
    extend ActiveSupport::Concern
    
    module ClassMethods
      def create_from_array(the_array)
        the_array.each do |financial_report_hash|
          financial_report = create_from_hash(financial_report_hash)
          financial_report.create_statements_from_hash(financial_report_hash[:financial_statements])
        end
      end
      
      def create_from_hash(financial_report_hash)
        period_type = financial_report_hash[:period_type]
        period_ending = Date.strptime(financial_report_hash[:period_ending], "%m/%d/%Y")
        find_or_create_by_period_type_and_period_ending(period_type, period_ending)
      end
    end
    
    module InstanceMethods
      def create_statements_from_hash(the_hash)
        the_hash.each do |key, value|
          the_class = FinancialReport.classify_string(key)
          the_hash = {:financial_report_id => id}.merge(value)
          the_class.create(the_hash)
        end
      end
    end
  end
end