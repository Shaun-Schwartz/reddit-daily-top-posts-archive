class RedditPostsController < ApplicationController
  def archive
    year = params.require('date')['year']
    month = params.require('date')['month']
    day = params.require('date')['day']
    @date = Date.new(year.to_i, month.to_i, day.to_i)
    @subreddit = params['subreddit']
    @posts = RedditPost.where(submitted_date: @date)
  end
end
