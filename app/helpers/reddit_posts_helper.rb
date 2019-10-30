require 'httparty'
module RedditPostsHelper

  CLIENT_ID = Rails.application.credentials.reddit_client_id
  CLIENT_SECRET = Rails.application.credentials.reddit_client_secret
  REDDIT_USER = Rails.application.credentials.reddit_user
  REDDIT_PWD = Rails.application.credentials.reddit_password
  USER_AGENT = "RedditTopPostArchive/0.1 by #{REDDIT_USER}"
  NUM_OF_POSTS = 2

  def self.get_token()
    options = {
      basic_auth: {'username': CLIENT_ID, 'password': CLIENT_SECRET},
      body: {'grant_type': 'password', 'username': REDDIT_USER, 'password': REDDIT_PWD},
      headers: {'User-Agent': USER_AGENT}
    }
    response = HTTParty.post('https://www.reddit.com/api/v1/access_token', options)
    return response['access_token']
  end

  def self.get_subreddit_top_posts(subreddit)
    token = self.get_token()
    options = {
      headers: {'Authorization': "bearer #{token}", 'User-Agent': USER_AGENT}
    }
    response = HTTParty.get("https://oauth.reddit.com/r/#{subreddit}/top/?t=day/.json?limit=#{NUM_OF_POSTS}", options)
    return response
  end

  def self.upvotes_formatter(upvotes)
    if upvotes >= 1000
      return "#{ActionController::Base.helpers.number_with_precision(upvotes.to_f/1000, precision: 1)}k"
    else
      return upvotes
    end
  end

  def self.submitted_formatter(submitted)
    hour_in_seconds = 3600
    seconds_since_submission = (Time.now - submitted).round
    if seconds_since_submission <= hour_in_seconds
      minutes_since_submission = (seconds_since_submission / 60).round
      return "#{ActionController::Base.helpers.pluralize(minutes_since_submission, 'minute')} ago"
    elsif (seconds_since_submission / hour_in_seconds).round > 24
      days_since_submission = ((seconds_since_submission / hour_in_seconds) / 24).round
      return "#{ActionController::Base.helpers.pluralize(days_since_submission, 'day')} ago"
    else
      hours_since_submission = (seconds_since_submission / hour_in_seconds).round
      return "#{ActionController::Base.helpers.pluralize(hours_since_submission, 'hour')} ago"
    end
  end
end
