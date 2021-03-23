import { Container } from 'react-bootstrap';
import { Switch, Route } from 'react-router-dom';

import "./App.scss";
import Users from "./Users";
import Nav from "./Nav";

function App() {
  return (
    <Container>
      <Nav />
      <Switch>
        <Route path="/" exact>
          <h1>EventsApp Feed</h1>
        </Route>
        <Route path="/users">
          <Users />
        </Route>
      </Switch>
    </Container>
  );
}

export default App;