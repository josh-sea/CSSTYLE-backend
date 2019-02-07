class CreateSnippetTags < ActiveRecord::Migration[5.2]
  def change
    create_table :snippet_tags do |t|
      t.integer :snippet_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
