@Search = React.createClass
  getDefaultProps: ->
    populateResults: ->

  handleSubmit: (e) ->
    e.preventDefault()
    input = React.findDOMNode(@refs.search_input).value

    $.ajax
      method: 'GET'
      url: "/search/?query=#{input}"
      dataType: 'JSON'
      success: (data) =>
        @props.populateResults data.search
      error: (data) =>
        alert("Well that didn't work as expected")


  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        React.DOM.input
          type: 'search'
          className: 'search-input'
          name: 'search'
          autoFocus: true
          placeholder: 'Search things here...'
          ref: 'search_input'
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        'Search'