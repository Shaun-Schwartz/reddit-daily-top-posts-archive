class PagesController < ApplicationController
  def home
    # @todays_posts = RedditPost.where("submitted_date::date = ?", Date.today.to_s)
    @todays_posts = RedditPost.last(50)
  end
end
