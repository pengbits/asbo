import React, {Component, PropTypes} from 'react'
import { connect } from 'react-redux'
import PlatformDetails from '../components/PlatformDetails'


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

const PlatformDetailsContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(PlatformDetails)

export default PlatformDetailsContainer
