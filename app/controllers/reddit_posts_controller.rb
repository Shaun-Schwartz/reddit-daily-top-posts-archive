class RedditPostsController < ApplicationController

  def index
    most_recent_post_date = RedditPost.reorder('created_at').last&.submitted_date
    @most_recent_posts = RedditPost.date(most_recent_post_date)
  end

  def archive
    year = params.require('date')['year']
    month = params.require('date')['month']
    day = params.require('date')['day']
    @date = Date.new(year.to_i, month.to_i, day.to_i)
    @subreddit = params['subreddit']
    @posts = RedditPost.date(@date).subreddit(@subreddit)
  end

  def subreddits
    render json: {subreddits: RedditPost::SUBREDDITS}
  end
end
