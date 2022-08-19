# frozen_string_literal: true

Types::MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  field :logged_in_user, function: Mutations::LoggedInUser.new
  field :add_message, function: Mutations::AddMessage.new
  field :delete_message, function: Mutations::DeleteMessage.new
  field :edit_message, function: Mutations::EditMessage.new
end
