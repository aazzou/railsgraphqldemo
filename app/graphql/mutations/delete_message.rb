# frozen_string_literal: true
# app/graphql/mutations/add_message.rb

class Mutations::DeleteMessage < GraphQL::Function
  # define the arguments this field will receive
  argument :message_id, !types.Int

  # define what this field will return
  type types.Boolean

  # resolve the field's response
  def call(_obj, args, _ctx)
    if _ctx[:current_user].blank?
      raise GraphQL::ExecutionError, 'Authentication required'
    end

    user = _ctx[:current_user]
    return false unless user

    message_id = args[:message_id]
    return unless message_id

    message = Message.find_by :id => message_id, :user => user

    return false unless message

    message.delete
  end
end
