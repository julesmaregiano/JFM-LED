import ReactOnRails from 'react-on-rails';

import HelloWorld from '../bundles/HelloWorld/components/HelloWorld.jsx';
import ClientSelector from '../bundles/HelloWorld/components/ClientSelector.jsx';

// This is how react_on_rails can see the HelloWorld in the browser.
ReactOnRails.register({
  HelloWorld,
  ClientSelector
});
