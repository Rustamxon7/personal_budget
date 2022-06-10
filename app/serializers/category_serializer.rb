class CategorySerializer < ActiveModel::Serializer
  attributes :id, :title, :icon, :person_id, :sum_funds, :persons_array, :money, :person_id, :user_id

  def sum_funds
    object.funds.sum(:amount)
  end
end
