class GetDailyTopPostsJob
  include Sidekiq::Worker

  def perform
    RedditPost::SUBREDDITS.each do |subreddit|
      response = RedditPostsHelper.get_subreddit_top_posts(subreddit)
      return if response.code != 200
      posts = JSON.parse(response.body)['data']['children']
      posts.each do |post|
        post_data = post['data']
        RedditPost.create!(
          title: post_data['title'],
          subreddit: post_data['subreddit'],
          submitted_date: DateTime.strptime(post_data['created_utc'].to_s, '%s'),
          upvotes: post_data['ups'],
          permalink: post_data['permalink'],
          url: post_data['url']
        )
      end
    end
  end
end
