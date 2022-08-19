
# frozen_string_literal: true
# app/graphql/mutations/logged_in_user.rb

class Mutations::LoggedInUser < GraphQL::Function
  # define the arguments this field will receive
  argument :auth, !Types::AuthInput

  # define what this field will return
  type Types::AuthType

  # resolve the field's response
  def call(_obj, args, _ctx)
    input = args[:auth]
    return unless input

    user = User.find_by(email: input[:email])

    resp = OpenStruct.new(ok: false)

    return resp unless user
    return resp unless user.authenticate( input[:password] )

    token = AuthToken.token(user)

    OpenStruct.new(ok: true, jwt: token,  user: user)
  end
end
