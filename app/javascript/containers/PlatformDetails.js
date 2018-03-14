import React, {Component, PropTypes} from 'react'
import { connect } from 'react-redux'
import PlatformDetails from '../components/PlatformDetails'
import {destroyPlatform} from '../redux/platforms'

const mapStateToProps = (state, ownProps) => {  
  const {platform,loading,error} = state.platforms 
  return {...platform,error,loading}
}

const mapDispatchToProps = (dispatch, ownProps) => {
  return {
    destroyPlatform: (opts) =>{
      dispatch(destroyPlatform(opts))
    }
  }
}

const PlatformDetailsContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(PlatformDetails)

export default PlatformDetailsContainer
