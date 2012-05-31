module Extensions
  module FetchCompanyDetails
    extend ActiveSupport::Concern
    
    include Extensions::FetchScraper
    
    def fetch_company_details
      fetch_name
    end
    
    def fetch_name
      doc = doc_for_url(details_url)
      self.name = doc.css('#quickquoteb .hr .cnex .cn a').first.content
    end
  end
end