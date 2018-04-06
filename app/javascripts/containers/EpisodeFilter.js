import React, {Component, PropTypes} from 'react'
import { connect } from 'react-redux'
import EpisodeFilter from '../components/EpisodeFilter'
import {setFilterAndFetch} from '../redux/episodes'

const mapStateToProps = (state, ownProps) => {
  const {
    filter
  } = state.episodes

  return {
    filter
  }
}

const mapDispatchToProps = (dispatch, ownProps) => {
  return {
    setFilter: ({filter}) => {
      console.log(`dispatch setFilterAndFetch ${filter}`)
      dispatch(setFilterAndFetch(filter))
    }
  }
}

const EpisodeFilterContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(EpisodeFilter)

export default EpisodeFilterContainer
