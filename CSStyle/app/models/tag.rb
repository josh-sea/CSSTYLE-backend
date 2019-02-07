class Tag < ApplicationRecord
  has_many :snippet_tags
  has_many :snippets, through: :snippet_tags
end
