import React, {Component, PropTypes} from 'react'
import { connect } from 'react-redux'
import PlatformDetails from '../components/PlatformDetails'
import {refreshPlatform} from '../redux/platforms'

const mapStateToProps = (state, ownProps) => {  
  const {platform,loading,error} = state.platforms 
  return {...platform,error,loading}
}

const mapDispatchToProps = (dispatch, ownProps) => {
  return {
    refreshPlatform: ({nickname}) =>{
      dispatch(refreshPlatform({nickname}))
    }
  }
}

const PlatformDetailsContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(PlatformDetails)

export default PlatformDetailsContainer
