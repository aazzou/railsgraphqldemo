# app/graphql/types/auth_input.rb
# frozen_string_literal: true

Types::MessageInput = GraphQL::InputObjectType.define do
  name 'MessageInput'

  argument :title, !types.String
  argument :content, !types.String
end


