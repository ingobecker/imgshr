import React from 'react'

import Icon from './Icon.jsx'

export default class UploadFileAction extends React.Component {
  render() {
    return (
      <div className="upload__file__actions">
        <Icon name="trash" onClick={this.props.remove}/>
      </div>
    )
  }
}
