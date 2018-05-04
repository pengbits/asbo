import React, {Component, PropTypes} from 'react'
import { connect } from 'react-redux'
import Media from '../components/Media'
import {initMedia} from '../redux/media'

const mapStateToProps = (state, ownProps) => {  
  const {embed} = state.media
  return {
    embed
  }
}

const mapDispatchToProps = (dispatch, ownProps) => {
  return {
    initMedia: () => {
      dispatch(initMedia())
    }
  }
}

const MediaContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(Media)

export default MediaContainer
