class SnippetSerializer < ActiveModel::Serializer
  attributes *Snippet.column_names, :user, :tags
 #  def self
 #   {owner_id: self.object.person.id,
 #    owner_name: self3.object.person.name}
 # end
end
