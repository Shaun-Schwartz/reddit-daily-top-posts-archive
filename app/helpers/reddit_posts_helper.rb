require 'httparty'
module RedditPostsHelper
  # REDDIT API
  CLIENT_ID = 'wD9aesYdkR1EjQ'
  CLIENT_SECRET = 'zoW9GibIEIUn92eFijqRzTBqHS8'

  # REDDIT USER CREDS
  REDDIT_USER = 'mr_november'
  REDDIT_PWD = '05s5y7wWxUZMrV2o'

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
