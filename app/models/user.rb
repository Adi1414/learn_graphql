class User < ApplicationRecord
	include AlgoliaSearch
	has_many :posts
	algoliasearch do
    attributes :name, :email, :created_at
     searchableAttributes ['unordered(name)', 'unordered(email)']
  end
end
