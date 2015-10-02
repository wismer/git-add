
module.exports =
class GitAddView
  constructor: (serializedState) ->
    # @highlightEvent = atom.config.observe 'editor.selectedText', (newVal, previous) ->
    #   @changeHighlightedText(newVal)
    # Create root element
    @element = document.createElement('div')
    @highlightedText = ''
    @element.classList.add('git-add')
    # Create message element
    message = document.createElement('div')
    message.textContent = "The GitAdd package is Alive! It's ALIVE!"
    message.classList.add('message')
    @element.appendChild(message)

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element

  callback: (text) ->
    console.log text.getSelectedText()
