module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: true
    field :name, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :posts , [Types::PostType], null: true
    field :post_count, Integer, null: true

    def post_count
    	object.posts.count
    end	
  end
end
