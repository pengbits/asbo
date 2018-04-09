import React, {Component, PropTypes} from 'react'
import { connect } from 'react-redux'
import EpisodeFilter from '../components/EpisodeFilter'
import {setFilterAndFetch} from '../redux/episodes'
import {setFilter} from '../redux/filter'

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
      const fn = ownProps.onSetFilter == 'fetch' ? setFilterAndFetch : setFilter
      console.log(ownProps.onSetFilter == 'fetch' ? 'setFilterAndFetch' : 'setFilter')
      dispatch(fn(filter))
    }
  }
}

const EpisodeFilterContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(EpisodeFilter)

export default EpisodeFilterContainer
