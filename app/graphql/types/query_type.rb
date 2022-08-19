# frozen_string_literal: true

Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  field :messages, types[Types::MessageType] do
    resolve lambda { |_obj, _args, ctx|
      if ctx[:current_user].blank?
        raise GraphQL::ExecutionError, 'Authentication required'
      end

      user = ctx[:current_user]
      user.messages
    }
  end
end
