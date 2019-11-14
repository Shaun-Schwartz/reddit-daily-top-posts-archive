import React, {Component} from 'react';

class RedditPostDetails extends Component {
  constructor (props) {
    super(props);
  }

  render () {
    const post = this.props.post;
    return (
      <div className='post'>
        <div className='upvote-container'>
          <div className='arrow'></div>
          {post.upvotes}
        </div>
        <div className='title'>
          <a href={post.url} target='_blank'>{post.title}</a>
        </div>
        <div className='post-info'>
          <div className='post-submitted'>
            submitted {post.submitted_date} to <a href={`https://reddit.com/r/${post.subreddit}`} target='_blank'>r/{post.subreddit}</a>
          </div>
          <div className='post-comments'>
            <a href={`https://reddit.com${post.permalink}`} target='_blank'>comments</a>
          </div>
        </div>
      </div>
    )

  }
}

export {RedditPostDetails};
