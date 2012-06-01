module Extensions
  module FinancialStatement
    extend ActiveSupport::Concern
    
    included do
      belongs_to :financial_report
      delegate :period_ending, :to => :financial_report
      
      scope :annual, joins(:financial_report).merge(FinancialReport.annual)
      scope :quarterly, joins(:financial_report).merge(FinancialReport.quarterly)
      scope :recent, limit(5)
    end
    
    module ClassMethods
      def all_items_keys
        self.all_items_hash.inject([]) do |the_array, group_hash|
          the_array << group_hash[:items]
          the_array
        end.flatten
      end
                  
      # TRANSLATION CONCERNS
      def name_for_item(item)
        translation_for_item(item, 'name')
      end
      
      def dom_id_for_item(item)
        translation_for_item(item, 'dom_id')
      end
      
      def translation_for_item(item, key)
        I18n.t("#{self.to_s.underscore}.#{item}.#{key}")
      end
      # END TRANSLATION CONCERNS      
    end
  end
end