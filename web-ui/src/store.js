import { createStore, combineReducers } from 'redux';

function users(state = [], action) {
  switch (action.type) {
  case 'users/set':
    return action.data;
  default:
    return state;
  }
}

function user_form(state = {}, action) {
  switch (action.type) {
  case 'user_form/set':
    return action.data;
  case 'session/clear':
    return {name: "", email: "", password: "", photo_hash: ""};
  default:
    return state;
  }
}

function events(state = [], action) {
  switch (action.type) {
  case 'events/set':
    return action.data;
  default:
    return state;
  }
}

function session(state = null, action) {
  switch (action.type) {
    case 'session/set': 
      return action.data;
    default:
      return state;
  }
}

function error(state = null, action) {
  switch (action.type) {
    case 'session/set': return null;
    case 'error/set': return action.data;
    default: return state;
  }
}

function root_reducer(state, action) {
  console.log("root_reducer", state, action);
  let reducer = combineReducers({
      users, user_form, events, session, error
  });

  return reducer(state, action);
}

let store = createStore(root_reducer);
export default store;