module.exports =
class NodeServiceBoilerplateView

  constructor: (serializedState) ->
    # Create root element
    @element = document.createElement('div')
    @element.classList.add('your-name-word-count')

    # Create message element
    message = document.createElement('div')
    message.textContent = "Choose path: "
    message.classList.add('message')
    @element.appendChild(message)

    # Create input field for generation path
    input = document.createElement('input')
    input.classList.add('input')
    @element.appendChild(input)

    # Create a submit button
    button = document.createElement('button')
    button.textContent = "Submit"
    button.classList.add('submit')
    button.onclick = ->
      alert(input.value)
    @element.appendChild(button)

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element
