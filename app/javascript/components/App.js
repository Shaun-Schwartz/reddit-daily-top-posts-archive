import React, {Component} from 'react';
import {Navigation} from './Navigation'
import {RedditPostIndexPage} from './RedditPostIndexPage'

class App extends Component {
  constructor (props) {
    super(props);
  }
  render () {
    return (
      <div className="App">
        <Navigation />
        <RedditPostIndexPage />
      </div>
    )
  }
}

export default App;
