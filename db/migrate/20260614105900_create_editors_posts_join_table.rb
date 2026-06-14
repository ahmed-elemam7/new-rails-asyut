class CreateEditorsPostsJoinTable < ActiveRecord::Migration[8.1]
  def change
    create_table :editors_posts, id: false do |t|
      t.references :editor, null: false, foreign_key: { to_table: :users }
      t.references :post, null: false, foreign_key: true
    end
  end
end