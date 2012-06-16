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
    
    # GROWTH RATE CALCULATIONS
    def calculate_growth_rates_from_statement!(previous_statement)
      self.class.all_items_keys.each do |the_method|
        growth_method = "#{the_method.to_s}_growth".to_sym
        self[growth_method] = growth_rate_for_line_items(self[the_method], previous_statement[the_method])
      end
      save
    end
    
    def growth_rate_for_line_items(current, previous)
      return nil unless FinancialReport.is_divisible?(current, previous)
      (current - previous) / previous * 100
    end
    # END GROWTH RATE CALCULATIONS
    
    def sum_from_items(items)
      items.inject(0) do |sum, item|
        the_item = self[item] || 0
        sum = sum + the_item
        sum
      end
    end
  end
end