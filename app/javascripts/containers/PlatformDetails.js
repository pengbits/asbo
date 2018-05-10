import React, {Component, PropTypes} from 'react'
import { connect } from 'react-redux'
import PlatformDetails from '../components/PlatformDetails'
import {setFilter} from '../redux/filter'
import {setPage} from '../redux/pagination'
import {refreshPlatform, deleteEpisodes} from '../redux/platforms'

const mapStateToProps = (state, ownProps) => {  
  const {platform,loading,error} = state.platforms;
  const {currentPage} = state.pagination
  const {episodes} = state.episodes
  return {
    ...platform,
    episodes,
    error,
    loading,
    currentPage,
    nextPage : (currentPage+1)
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
    
    deleteEpisodesForPlatform: ({nickname}) => {
      dispatch(deleteEpisodes({nickname}))
    },
    
    setFilterAndRefresh: ({nickname,filter}) => {
      dispatch(setFilter(filter));
      dispatch(refreshPlatform({nickname}))
    },
    
    setPageAndRefresh: ({nickname,page}) => {
      dispatch(setPage({page}))
      dispatch(refreshPlatform({nickname}))
    }
  }
}

const PlatformDetailsContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(PlatformDetails)

export default PlatformDetailsContainer
