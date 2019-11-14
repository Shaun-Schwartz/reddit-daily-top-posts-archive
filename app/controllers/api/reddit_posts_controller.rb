class Api::RedditPostsController < ApplicationController

  def index
    if params['date']
      year = params.require('date')['year']
      month = params.require('date')['month']
      day = params.require('date')['day']
      @date = Date.new(year.to_i, month.to_i, day.to_i)
      @subreddit = params['subreddit']
      @reddit_posts = RedditPost.date(@date).subreddit(@subreddit)
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
