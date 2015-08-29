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
      React.DOM.div null,
        React.DOM.h1
          className: 'title'
          'Hello'
        React.createElement Search, populateResults: @populateResults
        @renderResults @state.results