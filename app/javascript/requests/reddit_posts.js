import {BASE_URL} from './config'

export const RedditPost = {
  all() {
    return fetch(`${BASE_URL}/api/v1/battles`)
      .then(res => res.json())
  },
  subreddits() {
    return fetch(`${BASE_URL}/subreddits`)
      .then(res => res.json())
  }
}
