import React, {Component, PropTypes} from 'react'
import { connect } from 'react-redux'
import {loadPlatforms} from '../redux/platforms'
import PlatformList from '../components/PlatformList'


const mapStateToProps = (state, ownProps) => {
  const {
    platforms,
    platform,
    loading
  } = state.platforms

  return {
    platforms,
    loading
  }
}

const mapDispatchToProps = (dispatch, ownProps) => {
  return {}
}

const PlatformListContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(PlatformList)

export default PlatformListContainer
