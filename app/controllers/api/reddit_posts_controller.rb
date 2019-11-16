class Api::RedditPostsController < ApplicationController

  def index
    if params['date']
      @date = params['date']
      @subreddit = params['subreddit']
      if @subreddit == 'all'
        @reddit_posts = RedditPost.date(@date)
      else
        @reddit_posts = RedditPost.date(@date).subreddit(@subreddit)
      end
    else
      most_recent_post_date = RedditPost.reorder('created_at').last&.submitted_date
      @reddit_posts = RedditPost.date(most_recent_post_date)
    end
    render 'api/reddit_posts', status: 200
  end

  def subreddits
    render json: {subreddits: RedditPost::SUBREDDITS}
  end
end
