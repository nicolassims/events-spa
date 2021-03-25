import { Row, Col, Form, Button } from 'react-bootstrap';
import { connect } from 'react-redux';
import { useState } from 'react'
import { useHistory } from 'react-router-dom';
//import pick from 'lodash/pick';

import { create_event, fetch_events } from '../api';

function EventsNew({session}) {
  let history = useHistory();
  const [event, setEvent] = useState({name: "", date: "", guests: "", body: ""});

  /*function check_pass(p1, p2) {
    if (p1 !== p2) {
      return "Passwords don't match.";
    }

    if (p1.length < 8) {
      return "Password too short.";
    }

    return "";
  }*/

  function update(field, ev) {
    let u1 = Object.assign({}, event);
    u1[field] = ev.target.value;
    //u1.password = u1.pass1;
    //u1.pass_msg = check_pass(u1.pass1, u1.pass2);
    setEvent(u1);
  }

  function onSubmit(ev) {
    ev.preventDefault();

    //let data = pick(event, ['name', 'date', 'guests', 'body']);
    let sess = JSON.parse(localStorage.getItem("session"));
    event['user_id'] = sess.user_id;
    create_event(event);
    fetch_events();
    history.push("/");
  }

  return (
    <Row>
      <Col>
        <h2>New Event</h2>
        <Form onSubmit={onSubmit}>
          <Form.Group>
            <Form.Label>Name</Form.Label>
            <Form.Control type="text"
                          onChange={(ev) => update("name", ev)}
                          value={event.name || ""} />
          </Form.Group>
          <Form.Group>
            <Form.Label>Date</Form.Label>
            <Form.Control type="text"
                          onChange={(ev) => update("date", ev)}
                          value={event.date || ""} />
          </Form.Group>
          <Form.Group>
            <Form.Label>Guests</Form.Label>
            <Form.Control type="text"
                          onChange={(ev) => update("guests", ev)}
                          value={event.guests || ""} />
          </Form.Group>
          <Form.Group>
            <Form.Label>Description</Form.Label>
            <Form.Control type="textarea"
                          onChange={(ev) => update("body", ev)}
                          value={event.body || ""} />
          </Form.Group>

          <Button variant="primary"
                  type="submit">
            Save
          </Button>
        </Form>
      </Col>
    </Row>
  );
}

function state2props() {
  return {};
}

export default connect(state2props)(EventsNew);