class CreateRedditPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :reddit_posts, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :title
      t.string :subreddit
      t.datetime :submitted_date
      t.integer :upvotes
      t.text :permalink
      t.text :url
      t.timestamps
    end
  end
end
