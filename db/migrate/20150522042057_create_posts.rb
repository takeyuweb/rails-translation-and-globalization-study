class CreatePosts < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      #t.string :title
      #t.text :text

      t.timestamps null: false
    end
    Post.create_translation_table! title: :string, text: :text
  end

  def down
    drop_table :posts
    Post.drop_translation_table!
  end
end
