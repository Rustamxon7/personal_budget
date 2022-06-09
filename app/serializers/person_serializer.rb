class PersonSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id, :icon
end
