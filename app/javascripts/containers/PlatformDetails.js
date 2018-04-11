import React, {Component, PropTypes} from 'react'
import { connect } from 'react-redux'
import PlatformDetails from '../components/PlatformDetails'
import {setFilter} from '../redux/filter'
import {refreshPlatform} from '../redux/platforms'

const mapStateToProps = (state, ownProps) => {  
  const {platform,loading,error} = state.platforms 
  return {
    ...platform,
    error,
    loading
  }
}

const mapDispatchToProps = (dispatch, ownProps) => {
  return {
    setFilter: (filter) => {
      dispatch(setFilter(filter))
    },
    refreshPlatform: ({nickname}) => {
      dispatch(refreshPlatform({nickname}))
    },
    setFilterAndRefresh: ({nickname,filter}) => {
      dispatch(setFilter(filter));
      dispatch(refreshPlatform({nickname}))
    }
  }
}

const PlatformDetailsContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(PlatformDetails)

export default PlatformDetailsContainer
