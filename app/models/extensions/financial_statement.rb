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
      
      def dom_hash
        all_items_keys.inject({}) do |the_hash, item|
          the_hash[item] = I18n.t("#{self.to_s.underscore}.#{item.to_s}.dom_id")
          the_hash
        end
      end
      
      # PRESENTER
      def formatted_hash
        statements = all
        formatted_hash_from_array(statements)
      end
      
      def formatted_hash_from_array(statements)
        new_hash = {:periods => periods_from_statements(statements)}
        new_hash[:groups] = modified_all_items_hash(statements)
        new_hash
      end
      # END PRESENTER
      
      private
      
      def modified_all_items_hash(statements)
        all_items_hash.each do |group|
          group[:items] = modified_group_items(group[:items], statements)
        end
      end
      
      def modified_group_items(items, statements)
        items.inject([]) do |the_array, item|
          the_hash = {:item_key => I18n.t("#{self.to_s.underscore}.#{item}.name")}
          the_hash[:values] = statements.map { |s| s[item] }
          the_array << the_hash
          the_array
        end
      end
      
      def periods_from_statements(statements)
        statements.inject([]) do |the_array, statement|
          the_array << statement.period_ending.strftime("%m/%d/%Y")
          the_array
        end
      end
    end
  end
end