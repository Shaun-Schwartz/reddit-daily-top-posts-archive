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
end
