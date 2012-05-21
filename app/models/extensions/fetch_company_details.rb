require 'open-uri'

module Extensions
  module FetchCompanyDetails
    extend ActiveSupport::Concern
    
    module InstanceMethods
      def fetch_company_details
        fetch_name
      end
      
      def fetch_name
        doc = Nokogiri::HTML(open("http://investing.money.msn.com/investments/stock-price?Symbol=#{self.ticker}%2C&ocid=qbeb"))
        self.name = doc.css('#quickquoteb .hr .cnex .cn a').first.content
      end
    end
  end
end