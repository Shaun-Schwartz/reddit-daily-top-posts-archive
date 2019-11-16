json.extract! reddit_post, :id, :title, :subreddit, :permalink, :url,
  :created_at, :updated_at

json.submitted_date RedditPostsHelper.submitted_formatter(reddit_post.submitted_date)
json.upvotes RedditPostsHelper.upvotes_formatter(reddit_post.upvotes)
