import React, {Component} from 'react'
import { Field, reduxForm } from 'redux-form'

const Hints = {
  'attr_map' : (<em>
    Rules for scraping the platform&apos;s html and parsing it into Episodes. Each value/selector is mapped to a property.
  </em>),
  'pagination' : (<em>
    The pagination settings for the platform. Provide  one of the following: a route (regex-style pattern for constructing a fragment to append to the end of the url), a url: (a totally different url is used ) or a param (a paremeter to send along with the request), plus the number of items per page
  </em>)
}

export default ({component}) => {
  return Hints[component]
}
