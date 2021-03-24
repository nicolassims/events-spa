import store from './store';

export async function api_get(path) {
  let text = await fetch("http://localhost:4000/api/v1" + path, {});
  let resp = await text.json();
  return resp.data;
}

export function fetch_users() {
  api_get("/users").then((data) => store.dispatch({
      type: 'users/set',
      data: data,
  }));
}

export function fetch_events() {
  api_get("/events").then((data) => store.dispatch({
    type: 'events/set',
    data: data,
  }));
}

async function api_post(path, data) {
  let opts = {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(data),
  };
  let text = await fetch("http://localhost:400/api/v1" + path, opts);
  return await text.json();
}

export function api_login(name, password) {
  api_post("/session", {name, password}).then((data) => {
    console.log("login resp", data);
    let action = {
      type: 'session/set',
      data: data
    }
    store.dispatch(action);
  });
}

export function load_defaults() {
  fetch_events();
  fetch_users();
}