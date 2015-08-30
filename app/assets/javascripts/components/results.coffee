@Results = React.createClass

  getDefaultProps: ->
    results: []

  getInitialState: ->
    results: []

  populateResults: (results) ->
    @setState results: results

  renderResults: (results) ->
    results.map (result) =>
      React.createElement Result, key: "result-#{result.id}", result: result

  render: ->
    React.DOM.div
      className: 'container'
      React.DOM.h1
        className: 'title'
        'Welcome to database search'
      React.createElement Search, populateResults: @populateResults
      React.DOM.div
        className: 'results row'
        @renderResults @state.results