import { isEmpty, isNull } from 'lodash';
import { Row, Col, Card } from 'react-bootstrap';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';

function Event({event, users}) {
  let user_id = undefined;
  let email = undefined;
  if (!(isNull(localStorage.getItem("session")) || isEmpty(users))) {
    user_id = JSON.parse(localStorage.getItem("session")).user_id;
    email = users.find(value => value.id === user_id).email;
  }
  return (
    <Col>
      <Card style={{width: 300, padding: 20}}>
        <Card.Title className="h5 text-center">
          {event.name}
        </Card.Title>
        <Card.Text>
          On {event.date}<br />
          Posted by {event.user.name}
        </Card.Text>
        <Link 
          to={"/events/" + event.id} 
          hidden={!(event.guests.includes(email) 
            || user_id === event.user.id)}>
          View Event
        </Link>
      </Card>
    </Col>
  );
}

function Feed({events, users}) {
  let cards = events.map((event) => <Event event={event} users={users} key={event.id} />);
  return (
    <div>
      <h2>Feed</h2>
      <p>
        <Link to="/events/new" hidden={isNull(localStorage.getItem("session"))}>
          New Event
        </Link>
      </p>
      <Row>
        { cards }
      </Row>
    </div>
  );
}

export default connect(({events, users}) => ({events, users}))(Feed);