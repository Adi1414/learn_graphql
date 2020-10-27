module Mutations
	class UpdatePost < BaseMutation
		argument :title, String, required: true
		argument :body, String, required: true
		argument :user_id, Integer, required: true
        argument :id, String, required: true

	  field :post, Types::PostType, null: true
	  field :errors, [String], null: true
    def resolve(args)
        post = Post.find(args[:id])
	    post.assign_attributes(args.except(:id))
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