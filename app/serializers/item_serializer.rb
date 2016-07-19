class ItemSerializer < ActiveModel::Serializer
  attributes :id, :description, :merchant_id, :name, :unit_price

  def unit_price
    price = object.unit_price.to_d / 100
    price.truncate.to_s + '.' + sprintf('%02d', (price.frac * 100).truncate)
  end
end
