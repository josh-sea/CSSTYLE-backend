class SnippetTag < ApplicationRecord
  belongs_to :user
  belongs_to :tag
end
