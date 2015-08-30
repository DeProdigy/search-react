@Search = React.createClass

  getDefaultProps: ->
    populateResults: ->

  getInitialState: ->
    edit: false

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

  inputExists: ->
    React.findDOMNode(@refs.search_input).value.length > 0

  handleChange: ->
    @setState edit: @inputExists()

  buttonName: ->
    if @state.edit
      'Search'
    else
      'All'

  render: ->
    React.DOM.div
      className: 'row'
      React.DOM.form
        className: 'form-inline col-sm-12'
        onSubmit: @handleSubmit
        React.DOM.div
          React.DOM.input
            onChange: @handleChange
            type: 'search'
            className: 'search-input'
            name: 'search'
            autoFocus: true
            placeholder: 'Search things here...'
            ref: 'search_input'
        React.DOM.button
          type: 'submit'
          className: 'btn btn-primary search-button'
          @buttonName()