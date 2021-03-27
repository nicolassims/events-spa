import { Row, Col } from 'react-bootstrap';
import { connect } from 'react-redux';
import { isEmpty, isNull } from 'lodash';

function EventShow({events, users}) {

  let user_id = undefined;
  let email = undefined;
  let event = events.find(value => "/events/" + value.id === window.location.pathname);
  if (!(isNull(localStorage.getItem("session")) || isEmpty(users))) {
    user_id = JSON.parse(localStorage.getItem("session")).user_id;
    email = users.find(value => value.id === user_id).email;
  }
  return (
    <Row>
      <Col>
        <h1>{event.name}</h1><br />
        <h4><p>Posted by {event.user.id}</p></h4>
        <h4><p>Taking place on {event.date}</p></h4>
        <p>Details:</p>
        <p>{event.body}</p>
      </Col>
    </Row>
  );
}

export default connect(({events, users}) => ({events, users}))(EventShow);