class UserSerializer < ActiveModel::Serializer
  ActiveModel::Serializer.config.adapter = :json
  attributes :email
end