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
            
      # PRESENTER
      def formatted_hash
        formatted_hash_from_array(all)
      end
      
      def formatted_hash_from_array(statements)
        {
          :periods => periods_from_statements(statements),
          :groups => modified_all_items_hash(statements)
        }
      end
      # END PRESENTER
      
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
      
      private
      
      def modified_all_items_hash(statements)
        all_items_hash.each do |group|
          group[:items] = modified_group_items(group[:items], statements)
        end
      end
      
      def modified_group_items(items, statements)
        items.map do |item|
          {
            :item_key => name_for_item(item),
            :values => statements.map { |s| s[item] }
          }
        end
      end
      
      def periods_from_statements(statements)
        statements.map { |s| s.period_ending.strftime("%m/%d/%Y") }
      end
    end
  end
end