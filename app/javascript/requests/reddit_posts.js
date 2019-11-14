import {BASE_URL} from './config'

export const RedditPost = {
  subreddits() {
    return fetch(`${BASE_URL}/subreddits`)
      .then(res => res.json())
  },
  index() {
    return fetch(`${BASE_URL}/reddit_posts`)
      .then(res => res.json())
  }
}
