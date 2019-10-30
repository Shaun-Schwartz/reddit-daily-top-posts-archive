class RedditPost < ApplicationRecord
  SUBREDDITS = ['announcements', 'funny', 'askreddit', 'gaming', 'pics', 'science',
                'worldnews', 'aww', 'todayilearned', 'movies', 'videos', 'music',
                'iama', 'news', 'gifs']

  scope :date, -> (datetime) { where('submitted_date::date = :datetime::date', datetime: datetime)}
  scope :subreddit, -> (subreddit) { where(subreddit: subreddit) }
end
