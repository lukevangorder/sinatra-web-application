class CreatePostsTable < ActiveRecord::Migration[4.2]
    def change
        create_table :posts do |t|
            t.string :content
            t.string :posted_at
            t.integer :user_id
        end
    end
end