import { Row, Col } from 'react-bootstrap';
import { connect } from 'react-redux';
import { isEmpty, isNull } from 'lodash';

function EventShow({events, users}) {

  let user_id = undefined;
  let email = undefined;
  let event = events.find(value => "/events/" + value.id === window.location.pathname);
  let guestnumbers = undefined;
  if (!(isNull(localStorage.getItem("session")) || isEmpty(users))) {
    guestnumbers = Math.max((event.guests.match(/,/g) || []).length - 1, 0)
    user_id = JSON.parse(localStorage.getItem("session")).user_id;
    email = users.find(value => value.id === user_id).email;
  }
  if((event === undefined || event.guests.includes(email) || user_id === event.user.id)) {
    return (
      <Row>
        <Col>
          <h1>{event.name}</h1><br />
          <h4><p>Posted by {event.user.name}</p></h4>
          <h4><p>Taking place on {event.date}</p></h4>
          <p>{guestnumbers} invited.</p>
          <p>Details:</p>
          <p>{event.body}</p>
          Comments and responses would go here... if I could figure this out in time.
        </Col>
      </Row>
    );
  } else {
    return (<div>You can't see this event!</div>)
  }
}

export default connect(({events, users}) => ({events, users}))(EventShow);