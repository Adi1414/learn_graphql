module Types
  class QueryType < Types::BaseObject
    field :users, [Types::UserType], null: false
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    def users
      User.all
    end  

    field :user, Types::UserType, null:false do 
      argument :id, ID , required: true
    end

    def user(id:)
      User.find(id)
    end  

    field :post_count, Integer , null: true do
      argument :user_id, Integer ,  required: true
    end

    def post_count(user_id)
      Post.where(user_id: user_id[:user_id]).count
    end  

    field :posts, [Types::PostType], null: true do
      description 'Search notes'
      argument :search, String, required: false
      argument :order, String, required: false
    end

    def posts(search: nil, order: :asc)
      return by_search(search, order) if search.present?
        
        Post.order(created_at: order)
    end

  def by_search(search, order)
        Post.order(created_at: order).search(search)
    end
  end
end
