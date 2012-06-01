require 'open-uri'

module Extensions
  module FetchScraper
    extend ActiveSupport::Concern
    
    def doc_for_url(url)
      Rails.logger.info "Scraped URL: #{url}"
      Nokogiri::HTML(open(url))
    end
    
    def cell_values_from_row(doc, dom_id, include_first_cell = false)
      the_parent = doc.css(dom_id).first.try(:parent)
      if the_parent
        table_cells = the_parent.css('td')
        table_cells.shift unless include_first_cell
        table_cells.map { |c| c.content.strip }
      else
        6.times.map {|i| nil}
      end
    end
    
    def cell_index_for_period_ending(doc, period_ending)
      cell_values_from_row(doc, period_dom_id).index(period_ending)
    end
    
    def line_items_hash_for_statement(doc, the_class, the_index)
      the_class.all_items_keys.inject({}) do |the_hash, the_method|
        dom_id = "##{the_class.dom_id_for_item(the_method)}"
        the_hash[the_method] = formatted_cell_value(cell_values_from_row(doc, dom_id)[the_index])
        the_hash
      end
    end
    
    def formatted_cell_value(cell)
      cell.gsub(/,/, '').to_f if cell
    end
    
    def period_dom_id
      '#FiscalPeriodEndDate'
    end
    
  end
end