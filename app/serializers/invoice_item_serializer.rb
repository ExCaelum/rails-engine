class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :id, :invoice_id, :item_id, :quantity, :unit_price

  def unit_price
    price = object.unit_price.to_d / 100
    price.truncate.to_s + '.' + sprintf('%02d', (price.frac * 100).truncate)
  end
end
