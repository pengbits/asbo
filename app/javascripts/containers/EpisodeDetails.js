import React, {Component, PropTypes} from 'react'
import { connect } from 'react-redux'
import EpisodeDetails from '../components/EpisodeDetails'
import {refreshEpisode} from '../redux/episodes'

const mapStateToProps = (state, ownProps) => {  
  const {episode,loading,error} = state.episodes 
  return {...episode,error,loading}
}

const mapDispatchToProps = (dispatch, ownProps) => {
  return {}
}

const EpisodeDetailsContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(EpisodeDetails)

export default EpisodeDetailsContainer
