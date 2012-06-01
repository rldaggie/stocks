class CompanyDecorator < Draper::Base
  decorates :company
  
  # CREATING TABLE FOR /companies/:id/financial_reports
  def financial_reports_table_hash(period_type)
    financial_reports = eval("model.financial_reports.recent.#{period_type}.include_statements")
    FinancialReport.statements_array.inject({}) do |the_hash, statement|
      the_hash[statement] = financial_statement_table_hash(statement, financial_reports)
      the_hash
    end
  end
  
  def financial_statement_table_hash(statement, financial_reports)
    statements = financial_reports.map { |fr| eval("fr.#{statement.to_s}") }
    {
      :statement_key => statement, 
      :statement => {
        :periods => periods_from_financial_reports(financial_reports),
        :groups => financial_statement_table_groups_array(statement, statements)
      }
    }
  end
  
  def financial_statement_table_groups_array(statement, statements)
    the_class = statement.to_s.camelize.constantize
    the_class.all_items_hash.each do |group|
      group[:items] = financial_statement_table_group_hash(group[:items], statements, the_class)
    end
  end
  
  def financial_statement_table_group_hash(items, statements, the_class)
    items.map do |item|
      {
        :item_key => the_class.name_for_item(item),
        :values => statements.map { |s| s[item] }
      }
    end
  end
  
  def periods_from_financial_reports(financial_reports)
    financial_reports.map { |fr| fr.period_ending.strftime("%m/%d/%Y") }
  end
  # END TABLE
end
