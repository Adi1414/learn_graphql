require 'rails_helper'

module Mutations
  module Posts
    RSpec.describe CreatePost, type: :request do
      describe '.resolve' do
        it 'creates a post' do
          user = create(:user)

          expect do
            post '/graphql', params: { query: query(user_id: user.id) }
          end.to change { Post.count }.by(1)
        end

        it 'returns a Post' do
          user = create(:user)
          post '/graphql', params: { query: query(user_id: user.id) }
          json = JSON.parse(response.body)
          data = json['data']['createPost']['post']
          expect(data).to include(
           'title'           => 'This is title of the post',
            'body'            => 'This is body of the post',
            'userId'            => user.id
          )
        end
      end

      def query(user_id:)
        <<~GQL
          mutation{
          createPost(input:{
            title: "This is title of the post",
            body: "This is body of the post",
            userId: #{user_id} 
          })
          {
            post{
              title
              body
              createdAt
              updatedAt
              userId
            }
            errors
          }
        }
        GQL
      end
    end
  end
end