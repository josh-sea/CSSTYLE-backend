# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create_table "snippet_tags", force: :cascade do |t|
#   t.integer "snippet_id"
#   t.integer "tag_id"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
#
# create_table "snippets", force: :cascade do |t|
#   t.integer "user_id"
#   t.string "html"
#   t.string "css"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
#
# create_table "tags", force: :cascade do |t|
#   t.string "tag_name"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
#
# create_table "users", force: :cascade do |t|
#   t.string "username"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end

User.create(username:'Dan')
User.create(username:'Josh')

Snippet.create(name: 'Snippet 1', user_id: User.first.id, html: '<div> </div>', css: 'div {background: black;}')
Snippet.create(name: 'Snippet 2', user_id: User.first.id, html: '<div> </div>', css: 'div {background: black;}')
Snippet.create(name: 'Snippet 3', user_id: User.second.id, html: '<div> </div>', css: 'div {background: black;}')
Snippet.create(name: 'Snippet 4', user_id: User.second.id, html: '<div> </div>', css: 'div {background: black;}')

Tag.create(tag_name: 'p')
Tag.create(tag_name: 'div')
Tag.create(tag_name: 'modal')
Tag.create(tag_name: 'pop-up')
Tag.create(tag_name: 'header')
#
#
SnippetTag.create(tag_id: Tag.first.id, snippet_id: Snippet.first.id)
SnippetTag.create(tag_id: Tag.second.id, snippet_id: Snippet.first.id)
SnippetTag.create(tag_id: Tag.first.id, snippet_id: Snippet.second.id)
SnippetTag.create(tag_id: Tag.first.id, snippet_id: Snippet.third.id)
SnippetTag.create(tag_id: Tag.first.id, snippet_id: Snippet.fourth.id)
SnippetTag.create(tag_id: Tag.fourth.id, snippet_id: Snippet.first.id)
SnippetTag.create(tag_id: Tag.fifth.id, snippet_id: Snippet.third.id)
#
#
#
#









###########
