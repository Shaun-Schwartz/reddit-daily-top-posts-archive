import React, {Component} from 'react';
import {RedditPost} from '../requests/reddit_posts.js';
import Select from 'react-select'

class Navigation extends Component {
  constructor (props) {
    super (props);

    this.state = {
      loading: true,
      subreddits: [],
      chosenSubreddit: null
    }
  }

  componentDidMount() {
    RedditPost
      .subreddits()
      .then(res => {
        var subreddits = []
        res.subreddits.forEach(subreddit => {
          subreddits.push({'value': subreddit, 'label': subreddit})
        })
        this.setState({
          subreddits: subreddits,
          chosenSubreddit: res.subreddits[0],
          loading: false
        })
      })
  }

  render () {
    const loading = this.state.loading;
    const subreddits = this.state.subreddits;
    const chosenSubreddit = this.state.chosenSubreddit;
    if (loading) {
      return (
        <div className="header">
          Loading
        </div>
      )
    } else {
      return (
        <div className="header">
          <a href="/"><div className="logo"></div></a>
          <div className="picker">
            <h2 style={{marginTop: "10px", marginRight: "5px"}}>Subreddit: </h2>
            <Select
              className="subreddit-select"
              classNamePrefix="select"
              defaultValue={subreddits[0]}
              name="color"
              options={subreddits} />
          </div>
        </div>
      )
    }
  }
}

export {Navigation};
