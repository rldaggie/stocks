require 'open-uri'

module Extensions
  module FetchScraper
    extend ActiveSupport::Concern
    
    module InstanceMethods
      def doc_for_url(url)
        Nokogiri::HTML(open(url))
      end
      
      def cell_values_from_row(doc, dom_id, include_first_cell = false)
        the_parent = doc.css(dom_id).first.try(:parent)
        if the_parent
          table_cells = the_parent.css('td')
          table_cells.shift unless include_first_cell
          table_cells.map do |table_cell|
            table_cell.content.strip
          end
        else
          6.times.map {|i| nil}
        end
      end
      
      def cell_index_for_period_type(url, period_ending)
        doc = doc_for_url(url)
        cell_values_from_row(doc, period_dom_id).index(period_ending)
      end
      
      def line_items_hash_for_statement(url, the_class, the_index)
        dom_hash = the_class.dom_hash
        methods_array = the_class.all_items_keys
        doc = doc_for_url(url)
        methods_array.inject({}) do |the_hash, the_method|
          dom_id = "##{dom_hash[the_method]}"
          the_hash[the_method] = formatted_cell_value(cell_value_from_row_and_index(doc, dom_id, the_index))
          the_hash
        end
      end
      
      def formatted_cell_value(cell)
        cell.gsub(/,/, '').to_f if cell
      end
      
      def cell_value_from_row_and_index(doc, dom_id, index)
        cell_values_from_row(doc, dom_id)[index]
      end
      
      def period_dom_id
        '#FiscalPeriodEndDate'
      end
    end
  end
end