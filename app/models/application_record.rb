class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.attain(params)
    key = params.first
    value = params["search-key"]
    self.where("LOWER(#{key}) == #{value.to_s.downcase}")
  end
end
