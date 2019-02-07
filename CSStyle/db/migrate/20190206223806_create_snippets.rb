class CreateSnippets < ActiveRecord::Migration[5.2]
  def change
    create_table :snippets do |t|
      t.string :name
      t.integer :user_id
      t.string :html
      t.string :css

      t.timestamps
    end
  end
end
