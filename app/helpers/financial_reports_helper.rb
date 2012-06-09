module FinancialReportsHelper
  
  def statement_tab(statement)
    content_tag :li, statement_tab_link(statement)
  end
  
  def statement_tab_link(statement)
    text = statement.humanize.pluralize.titleize
    link_to text, "##{statement}", data: {toggle: 'tab'}
  end
  
  def statements_array
    FinancialReport.statements_array.map { |s| s.to_s }
  end
  
  def other_statements_link(the_action)
    the_period = the_action == 'annual' ? 'quarterly' : 'annual'
    link_to eval("#{the_period}_company_financial_reports_path(@company)"), class: 'btn' do
      raw "#{icon 'icon-list'} #{the_period.titleize} Statements"
    end
  end
  
end
