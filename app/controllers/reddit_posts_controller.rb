class RedditPostsController < ApplicationController

  def index
    # @todays_posts = RedditPost.where("submitted_date::date = ?", Date.today.to_s)
    @todays_posts = RedditPost.last(50)
  end

  def archive
    year = params.require('date')['year']
    month = params.require('date')['month']
    day = params.require('date')['day']
    @date = Date.new(year.to_i, month.to_i, day.to_i)
    @subreddit = params['subreddit']
    @posts = RedditPost.date(@date)
  end
end
