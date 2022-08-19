# frozen_string_literal: true

require 'graphql/batch'

Types::MessageType = GraphQL::ObjectType.define do
  name 'Message'

  field :id, !types.ID
  field :title, !types.String
  field :content, !types.String

  field :user, Types::UserType do
    resolve lambda { |obj, _args, _ctx|
      obj.user
    }
  end
end
