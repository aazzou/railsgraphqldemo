
require 'rails_helper'

module Types
    RSpec.describe QueryType, type: :request do
      describe '.resolve' do
        it 'list messages by user' do
          user = create(:user)
          message = create(:message, user: user)

          post '/graphql', params: {query: login_query(username: user.email, password: "secret")}

          json = JSON.parse(response.body)

          data = json['data']['logged_in_user']

          expect(data).to include(
                              'ok' => true
                          )
          jwt = data['jwt']

          post '/graphql', params: {query: messages_query}, headers: {:Authorization => "bearer #{jwt}" }

          json = JSON.parse(response.body)

          data = json['data']['messages']

          expect(data).to include({
                                      'title' => message.title,
                                      'content'  => message.content,
                                      'user' => {
                                          'email' => user.email
                                      }
                                  }
                          )
        end
        it 'check credentials before listing' do
          user = create(:user)
          message = create(:message, user: user)

          post '/graphql', params: {query: messages_query}, headers: {:Authorization => "bearer wrong_token_data" }

          json = JSON.parse(response.body)

          data = json['errors']

          expect( data.first ).to include(
                                "message" => "Authentication required"
                            )

        end
      end
      def login_query(username:, password:)
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

      def messages_query
        <<~GQL
          query{ 
            messages {
                  title
                  content
                  user {
                    email
                  }
              }
          }
        GQL
      end
    end
end