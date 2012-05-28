module Extensions
  module FinancialStatement
    extend ActiveSupport::Concern
    
    included do
      scope :annual, joins(:financial_report).merge(FinancialReport.annual)
      scope :quarterly, joins(:financial_report).merge(FinancialReport.quarterly)
    end
    
    module ClassMethods
      def all_items_keys
        self.all_items.inject([]) do |the_array, group_hash|
          the_array << group_hash[:items]
          the_array
        end.flatten
      end
      
      def dom_hash
        all_items_keys.inject({}) do |the_hash, item|
          the_hash[item] = I18n.t("#{self.to_s.underscore}.#{item.to_s}.dom_id")
          the_hash
        end
      end
    end
    
    module InstanceMethods
      
    end
  end
end