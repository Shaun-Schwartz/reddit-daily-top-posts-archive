import React, {Component} from 'react';
import {RedditPost} from '../requests/reddit_posts.js';
import Select from 'react-select'
import DatePicker from 'react-datepicker';
// import "react-datepicker/dist/react-datepicker.css";

class Navigation extends Component {
  constructor (props) {
    super (props);
  }

  render () {
    const {loadingSubreddits, subreddits, chosenSubreddit} = this.props
    if (loadingSubreddits) {
      return (
        <div className='header'>
          Loading
        </div>
      )
    } else {
      return (
        <div className='header'>
          <a href='/'><div className='logo'></div></a>
          <div className='picker'>
            <h2 style={{marginTop: '10px', marginRight: '5px'}}>Subreddit: </h2>
            <Select
              onChange={(e) => this.props.handleSubredditChange(e['value'])}
              className='subreddit-select'
              classNamePrefix='select'
              defaultValue={subreddits[0]}
              name='color'
              options={subreddits} />
            <h2 style={{marginTop: '10px', marginRight: '5px'}}>Date: </h2>
            <DatePicker
              className='date-picker'
              selected={this.props.startDate}
              onChange={this.props.handleDateChange} />
            <button onClick={this.props.handleClick} className='go-button'>Go</button>
          </div>
        </div>
      )
    }
  }
}

export {Navigation};
