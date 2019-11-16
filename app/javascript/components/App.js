import React, {Component} from 'react';
import {Navigation} from './Navigation'
import {RedditPostIndexPage} from './RedditPostIndexPage'
import {RedditPost} from '../requests/reddit_posts';

class App extends Component {
  constructor (props) {
    super(props);

    this.state = {
      loadingSubreddits: true,
      loadingPosts: true,
      posts: [],
      startDate: new Date(),
      subreddits: [],
      chosenSubreddit: 'all'
    }
  }

  componentDidMount() {
    RedditPost
      .subreddits()
      .then(res => {
        var subreddits = [{value: 'all', label: 'all'}]
        res.subreddits.forEach(subreddit => {
          subreddits.push({'value': subreddit, 'label': subreddit})
        })
        this.setState({subreddits: subreddits, loadingSubreddits: false})
      })
    RedditPost
      .index()
      .then(posts => {
        this.setState({posts: posts, loadingPosts: false})
      })
  }

  handleDateChange = date => {
    this.setState({startDate: date})
  }

  handleSubredditChange = subreddit => {
    this.setState({chosenSubreddit: subreddit})
  }

  handleGoButtonClick = () => {
    const date = this.state.startDate.toISOString();
    const subreddit = this.state.chosenSubreddit;
    this.setState({loadingPosts: true})
    RedditPost
      .index(date, subreddit)
      .then(posts => {
        this.setState({posts: posts, loadingPosts: false})
      })
  }

  render () {
    return (
      <div className='App'>
        <Navigation
          handleSubredditChange={this.handleSubredditChange}
          handleDateChange={this.handleDateChange}
          handleClick={this.handleGoButtonClick}
          startDate={this.state.startDate}
          {...this.state} />
        <RedditPostIndexPage
          loadingPosts={this.state.loadingPosts}
          posts={this.state.posts} />
      </div>
    )
  }
}

export default App;
