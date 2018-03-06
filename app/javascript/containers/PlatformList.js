import React, {Component, PropTypes} from 'react'
import { connect } from 'react-redux'
import PlatformList from '../components/PlatformList'


const mapStateToProps = (state, ownProps) => {
  const {
    platforms,
    platform
  } = state.platforms

  return {
    platforms 
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
