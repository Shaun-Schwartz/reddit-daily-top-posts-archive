class RedditPostsController < ApplicationController

  def index
    most_recent_post_date = RedditPost.reorder('created_at').last&.submitted_date
    @todays_posts = RedditPost.where("submitted_date::date = ?", most_recent_post_date)
  end

  def archive
    year = params.require('date')['year']
    month = params.require('date')['month']
    day = params.require('date')['day']
    @date = Date.new(year.to_i, month.to_i, day.to_i)
    @subreddit = params['subreddit']
    @posts = RedditPost.date(@date).subreddit(@subreddit)
  end
end
