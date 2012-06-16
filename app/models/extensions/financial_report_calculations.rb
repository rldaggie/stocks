module Extensions
  module FinancialReportCalculations
    extend ActiveSupport::Concern
    
    module ClassMethods
      def is_divisible?(current, previous)
        return false unless current && previous
        return false if previous == 0 || previous < 0
        true
      end
    end
    
    def calculate_ratios!
      calculate_inventory_turnover
      calculate_days_sales_in_receivables
      save
    end
    
    def calculate_inventory_turnover
      revenue_total = income_statement.revenue_total
      assets_current_inventory = balance_sheet.assets_current_inventory
      return nil unless FinancialReport.is_divisible?(revenue_total, assets_current_inventory)
      self.inventory_turnover = revenue_total / assets_current_inventory
    end
    
    def calculate_days_sales_in_receivables
      revenue_total = income_statement.try(:revenue_total)
      assets_current_receivables = balance_sheet.try(:assets_current_receivables)
      return nil unless FinancialReport.is_divisible?(revenue_total, assets_current_receivables)
      days = is_annual? ? 365 : 91
      self.days_sales_in_receivables = days / revenue_total / assets_current_receivables
    end
    
    def is_annual?
      period_type == 'annual'
    end
    
    def is_quarterly?
      FinancialReport::QUARTERS.include?(period_type)
    end
    
    def previous_report
      attrs = self.attributes
      self.class.where{(company_id == attrs['company_id']) & (period_type == attrs['period_type']) & (period_ending < attrs['period_ending'])}.include_statements.first
    end

    def calculate_growth_rates_for_statements!
      pr = previous_report
      return nil unless pr
      FinancialReport.statements_array.each do |statement|
        the_statement = eval "#{statement.to_s}"
        previous_statement = eval "pr.#{statement.to_s}"
        the_statement.calculate_growth_rates_from_statement!(previous_statement)
      end
    end
    
  end
end