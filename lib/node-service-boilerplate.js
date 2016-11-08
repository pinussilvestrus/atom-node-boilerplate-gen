'use babel';

import NodeServiceBoilerplateView from './node-service-boilerplate-view';
import { CompositeDisposable } from 'atom';

export default {

  nodeServiceBoilerplateView: null,
  modalPanel: null,
  subscriptions: null,

  activate(state) {
    this.nodeServiceBoilerplateView = new NodeServiceBoilerplateView(state.nodeServiceBoilerplateViewState);
    this.modalPanel = atom.workspace.addModalPanel({
      item: this.nodeServiceBoilerplateView.getElement(),
      visible: false
    });

    // Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    this.subscriptions = new CompositeDisposable();

    // Register command that toggles this view
    this.subscriptions.add(atom.commands.add('atom-workspace', {
      'node-service-boilerplate:toggle': () => this.toggle()
    }));
  },

  deactivate() {
    this.modalPanel.destroy();
    this.subscriptions.dispose();
    this.nodeServiceBoilerplateView.destroy();
  },

  serialize() {
    return {
      nodeServiceBoilerplateViewState: this.nodeServiceBoilerplateView.serialize()
    };
  },

  toggle() {
    console.log('NodeServiceBoilerplate was toggled!');
    return (
      this.modalPanel.isVisible() ?
      this.modalPanel.hide() :
      this.modalPanel.show()
    );
  }

};
