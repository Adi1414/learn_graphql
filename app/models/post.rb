class Post < ApplicationRecord
	include AlgoliaSearch
	belongs_to :user
	algoliasearch do
  attributes :title, :body
  searchableAttributes ['unordered(title)', 'unordered(body)']

  minWordSizefor1Typo 4
  minWordSizefor2Typos 8
  hitsPerPage 42
  end
end
