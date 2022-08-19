# frozen_string_literal: true
# app/graphql/mutations/add_message.rb

class Mutations::EditMessage < GraphQL::Function
  # define the arguments this field will receive
  argument :message_id, !types.Int
  argument :message, !Types::MessageInput

  # define what this field will return
  type Types::MessageType

  # resolve the field's response
  def call(_obj, args, _ctx)
    if _ctx[:current_user].blank?
      raise GraphQL::ExecutionError, 'Authentication required'
    end

    user = _ctx[:current_user]
    return unless user

    message_id = args[:message_id]
    return unless message_id

    input = args[:message]
    return unless input

    message = Message.find_by :id => message_id, :user => user

    return unless message

    message.title = input[:title]
    message.content = input[:content]

    message.save

    message
  end
end
