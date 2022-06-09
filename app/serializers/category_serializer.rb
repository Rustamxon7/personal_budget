class CategorySerializer < ActiveModel::Serializer
  attributes :id, :title, :icon, :person_id, :sum_funds

  def sum_funds
    object.funds.sum(:amount)
  end
end
