class SnippetSerializer < ActiveModel::Serializer
  attributes *Snippet.column_names, :user
end
