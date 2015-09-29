GitAddView = require './git-add-view'
{CompositeDisposable} = require 'atom'

module.exports = GitAdd =
  gitAddView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @gitAddView = new GitAddView(state.gitAddViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @gitAddView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'git-add:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @gitAddView.destroy()

  serialize: ->
    gitAddViewState: @gitAddView.serialize()

  toggle: ->
    console.log 'GitAdd was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
