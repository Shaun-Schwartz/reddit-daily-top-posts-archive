class RedditPost < ApplicationRecord
  SUBREDDITS = ['news', 'worldnews']

  scope :date, -> (datetime) { where('submitted_date::date = :datetime::date', datetime: datetime)}
  scope :subreddit, -> (subreddit) { where(subreddit: subreddit) }
end
