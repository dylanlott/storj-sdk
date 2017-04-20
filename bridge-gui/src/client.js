/**
 * THIS IS THE ENTRY POINT FOR THE CLIENT, JUST LIKE server.js IS THE ENTRY POINT FOR THE SERVER.
 */
import React from 'react';
import ReactDOM from 'react-dom';
import createStore from 'redux/create';
import {Provider} from 'react-redux';
import {ApolloProvider} from 'react-apollo';
import renderRoutes from 'routes';

const dest = document.getElementById('content');
const {store, apolloClient} = createStore();

Stripe.setPublishableKey(process.env.STRIPE_PUBLISHABLE_KEY);

ReactDOM.render(
  <ApolloProvider store={store} client={apolloClient}>
    {renderRoutes(store)}
  </ApolloProvider>,
  dest
);
