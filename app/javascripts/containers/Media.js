import React, {Component, PropTypes} from 'react'
import { connect } from 'react-redux'
import Media from '../components/Media'
import {initMedia} from '../redux/media'

const mapStateToProps = (state, ownProps) => {  
  const {episode} = (state.episodes || {})
  const {url}     = (state.media || {})

  return {
    src: 'foo'
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
