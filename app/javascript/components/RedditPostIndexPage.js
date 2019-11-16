import React, {Component} from 'react';
import {RedditPost} from '../requests/reddit_posts';
import {RedditPostDetails} from './RedditPostDetails';

class RedditPostIndexPage extends Component {
  constructor (props) {
    super (props);
  }

  render () {
    const {posts, loadingPosts} = this.props;
    if (loadingPosts) {
      return (
        <div className='posts'>
          Loading
        </div>
      )
    } else if (!loadingPosts && posts.length === 0) {
      return (
        <div className='posts'>
          <h2>No posts found</h2>
          <p>Try a different date or subreddit</p>
        </div>
      )
    } else {
      return (
        <div className='posts'>
          {posts.map(post => (
            <RedditPostDetails post={post} key={post.id}/>
          ))}
        </div>
      )
    }
  }
}

export {RedditPostIndexPage};
