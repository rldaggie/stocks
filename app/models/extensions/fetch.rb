module Extensions
  module Fetch
    extend ActiveSupport::Concern
    
    included do
      include Extensions::CompanyDetails
    end
  end
end