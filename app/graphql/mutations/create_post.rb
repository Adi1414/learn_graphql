module Mutations
	class CreatePost < BaseMutation
		argument :title, String, required: true
		argument :body, String, required: true
		argument :user_id, Integer, required: true

	  field :post, Types::PostType, null: true
	  field :errors, [String], null: true
    def resolve(title: nil, body: nil, user_id: nil)
	    post = Post.new(title: title, body: body, user_id: user_id)
      if post.save!
    		{
    			post: post ,
    			errors: []
    		}
    	else
    		{
    			post: nil,
    			errors: post.errors.full_messages
    		}
      end	
	  end 	
	end	
end