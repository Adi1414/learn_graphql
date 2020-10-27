require 'rails_helper'

module Mutations
  module Posts
    RSpec.describe UpdatePost, type: :request do
      describe 'resolve' do
        it 'updates a post' do
          user = create(:user)
          post   = create(:post, title: 'Test Title', body: 'Test Body', user_id: user.id)
          
          post '/graphql', params: { query: query(id: post.id, user_id: user.id) }
          expect(post.reload).to have_attributes(
            'user_id'          => user.id,
            'title'            => 'Test Title',
            'body'             => 'Test Body'
         )
        end

        it 'returns a post' do
          post   = create(:post, title: 'Test Title', body: 'Test Body')
          user = create(:user)

          post '/graphql', params: { query: query(id: post.id, user_id: user.id) }

          json = JSON.parse(response.body)
          data = json['data']['updatepost'][post]

          expect(data).to include(
            'userId'          => user.id,
            'title'            => 'Test Title',
            'body'             => 'Test Body'
          )
        end
      end

      def query(id:, user_id:)
        <<~GQL
          mutation{
          updatePost(input:{
            id: #{id},
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