import React from 'react'

import Icon from './Icon.jsx'
import ScrollToTop from 'react-scroll-up'

export default class ScrollToTopButton extends React.Component {
  render() {
      return (
        <ScrollToTop showUnder={320}>
          <button className="btn btn-default ScrollToTop" title='Back to top'>
            <Icon name="chevron-up"/>
          </button>
        </ScrollToTop>
      )
   }
}
