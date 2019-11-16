import {BASE_URL} from './config'

export const RedditPost = {
  subreddits() {
    return fetch(`${BASE_URL}/subreddits`)
      .then(res => res.json())
  },
  index(date = null, subreddit = null) {
    if (date !== null && subreddit !== null) {
      return fetch(`${BASE_URL}/reddit_posts?date=${date}&subreddit=${subreddit}`)
      .then(res => res.json())
    } else {
      return fetch(`${BASE_URL}/reddit_posts`)
      .then(res => res.json())
    }
  }
}
