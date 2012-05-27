class CashFlowStatement < ActiveRecord::Base
  belongs_to :financial_report
  
  scope :annual, joins(:financial_report).merge(FinancialReport.annual)
  scope :quarterly, joins(:financial_report).merge(FinancialReport.quarterly)
  
  attr_accessible :financial_report_id, :operating_net_income, :operating_depreciation, :operating_amortization, :operating_deferred_taxes, :operating_non_cash, :operating_changes_in_working_capital, :operating_total, :investing_capital_expenditures, :investing_other, :investing_total, :financing_items, :financing_dividends, :financing_stock, :financing_debt, :financing_total, :misc_foreign_exchange, :net_cash_change, :net_cash_beginning, :net_cash_ending
  
  OPERATING_ITEMS = {
    :operating_net_income => 'NetIncomeStartingLine', 
    :operating_depreciation => 'DepreciationDepletion', 
    :operating_amortization => 'Amortization', 
    :operating_deferred_taxes => 'DeferredTaxes', 
    :operating_non_cash => 'NonCashItems', 
    :operating_changes_in_working_capital => 'ChangesinWorkingCapital',
    :operating_total => 'CashfromOperatingActivities'
  }
  
  INVESTING_ITEMS = {
    :investing_capital_expenditures => 'CapitalExpenditures',
    :investing_other => 'OtherInvestingCashFlowItemsTot',
    :investing_total => 'CashfromInvestingActivities'
  }
  
  FINANCING_ITEMS = {
    :financing_items => 'FinancingCashFlowItems',
    :financing_dividends => 'TotalCashDividendsPaid',
    :financing_stock => 'IssuanceOrRetirementofStockNet',
    :financing_debt => 'IssuanceOrRetirementofDebtNet',
    :financing_total => 'CashfromFinancingActivities'
  }
  
  MISC_ITEMS = {
    :misc_foreign_exchange => 'ForeignExchangeEffects'
  }
  
  NET_ITEMS = {
    :net_cash_change => 'NetChangeinCash'
  }
  
  RESULT_ITEMS = {
    :net_cash_beginning => 'NetCashBeginningBalance', 
    :net_cash_ending => 'NetCashEndingBalance'
  }
  
  ALL_GROUPS = [OPERATING_ITEMS, INVESTING_ITEMS, FINANCING_ITEMS, MISC_ITEMS, NET_ITEMS, RESULT_ITEMS]
  
  ALL_ITEMS = ALL_GROUPS.inject({}) { |h, g| h.merge!(g) }
  
  ALL_ITEMS_KEYS = ALL_GROUPS.inject([]) { |a, h| a << h.keys; a }.flatten
end
