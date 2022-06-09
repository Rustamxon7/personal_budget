class FundSerializer < ActiveModel::Serializer
  attributes :id, :title, :amount, :type_operation, :date, :category_id, :note, :type_declaration, :icon
end
