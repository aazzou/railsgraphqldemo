# frozen_string_literal: true
# app/graphql/mutations/add_message.rb

class Mutations::AddMessage < GraphQL::Function
  # define the arguments this field will receive
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

    input = args[:message]
    return unless input

    message = Message.create!(
        :title => input[:title],
        :content => input[:content],
        :user => user
    )
  end
end
