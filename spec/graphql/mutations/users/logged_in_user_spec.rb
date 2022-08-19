require 'rails_helper'

module Mutations
  module Users
    RSpec.describe LoggedInUser, type: :request do
      describe '.resolve' do
        it 'log in a user' do
          user = create(:user)

          post '/graphql', params: {query: query(username: user.email, password: "secret")}

          json = JSON.parse(response.body)

          data = json['data']['logged_in_user']

          expect(data).to include(
                              'ok' => true
                          )

          expect(data['user']).to include(
                                      'id' => be_present,
                                      'email' => user.email
                                  )
        end

        it 'check wrong log in info' do
          post '/graphql', params: {query: query(username: 'wrong@email.com', password: "wrong_secret")}
          json = JSON.parse response.body

          data = json['data']['logged_in_user']

          expect(data).to include(
                              'ok' => false
                          )
        end
      end

      def query(username:, password:)
        <<~GQL
          mutation{ 
            logged_in_user(
                auth: {
                  email: "#{username}",
                  password: "#{password}"
                }) {
                ok,
                jwt,
                user {
                  id
                  email
                }
              }
          }
        GQL
      end
    end
  end
end