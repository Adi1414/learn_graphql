module Mutations
	class CreateUser < BaseMutation
		argument :email, String, required: true
		argument :name, String, required: true
	  
	  field :user, Types::UserType, null: true
	  field :errors, [String], null: true

	    def resolve(name: nil, email: nil)
	    	user = User.new(name: name, email: email)
	      if user.save!
	    		{
	    			user: user ,
	    			errors: []
	    		}
	    	else
	    		{
	    			user: nil,
	    			errors: user.errors.full_messages
	    		}
	      end	
	    end 	
	end	
end