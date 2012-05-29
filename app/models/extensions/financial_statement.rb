module Extensions
  module FinancialStatement
    extend ActiveSupport::Concern
    
    included do
      scope :annual, joins(:financial_report).merge(FinancialReport.annual)
      scope :quarterly, joins(:financial_report).merge(FinancialReport.quarterly)
      scope :recent, limit(5)
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
      
      def formatted_hash
        statements = all
        new_hash = {:periods => periods_from_statements(statements)}
        new_hash[:groups] = modified_all_items(statements)
        new_hash
      end
      
      private
      
      def modified_all_items(statements)
        all_items.each do |group|
          group[:items] = modified_group_items(group[:items], statements)
        end
      end
      
      def modified_group_items(items, statements)
        items.inject({}) do |the_hash, item|
          the_hash[:item_key] = item
          the_hash[:values] = values_from_statements(statements, item)
          the_hash
        end
      end
      
      def values_from_statements(statements, item)
        statements.inject([]) do |the_array, statement|
          the_array << statement[item]
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
    
    module InstanceMethods
      def period_ending
        financial_report.period_ending
      end
    end
  end
end