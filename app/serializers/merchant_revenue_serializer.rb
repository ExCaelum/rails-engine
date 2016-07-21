class MerchantRevenueSerializer < ActiveModel::Serializer
  attributes :revenue

  def revenue
    price = object.revenue.to_d / 100
    price.truncate.to_s + '.' + sprintf('%02d', (price.frac * 100).truncate)
  end
end
