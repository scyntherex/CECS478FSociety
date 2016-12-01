class MessageSerializer < ActiveModel::Serializer
    ActiveModel::Serializer.config.adapter = :json
    attributes :body
end
