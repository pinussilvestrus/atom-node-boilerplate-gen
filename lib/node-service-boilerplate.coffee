NodeServiceBoilerplateView = require './node-service-boilerplate-view'
{CompositeDisposable} = require 'atom'

module.exports = NodeServiceBoilerplate =
  nodeServiceBoilerplateView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @nodeServiceBoilerplateView = new NodeServiceBoilerplateView(state.nodeServiceBoilerplateViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @nodeServiceBoilerplateView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace',
      'node-service-boilerplate:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @wordcountView.destroy()

  serialize: ->
    nodeServiceBoilerplateViewState: @nodeServiceBoilerplateView.serialize()

  toggle: ->
    console.log 'NodeServiceBoilerplate was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
