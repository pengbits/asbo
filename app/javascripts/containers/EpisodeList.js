import React, {Component, PropTypes} from 'react'
import { connect } from 'react-redux'
import {loadEpisodes,setFilterAndFetch} from '../redux/episodes'
import EpisodeList from '../components/EpisodeList'

const mapStateToProps = (state, ownProps) => {
  const {
    episodes,
    episode,
    loading
  } = state.episodes

  return {
    episodes,
    loading
  }
}

const mapDispatchToProps = (dispatch, ownProps) => {
  return {
    onSetFilter: ({filter}) => {
      dispatch(setFilterAndFetch(filter))
    }
  }
}

const EpisodeListContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(EpisodeList)

export default EpisodeListContainer
