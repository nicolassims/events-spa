import { isNull } from 'lodash';
import { Row, Col, Card } from 'react-bootstrap';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';

function Event({event}) {
  return (
    <Col>
      <Card>
        <Card.Text>
          Posted by {event.user.name}<br />
          {event.body}
        </Card.Text>
      </Card>
    </Col>
  );
}

function Feed({events}) {
  let cards = events.map((event) => <Event event={event} key={event.id} />);
  return (
    <div>
      <h2>Feed</h2>
      <p><Link to="/events/new" hidden={isNull(localStorage.getItem("session"))}>
        New Event
      </Link></p>
      <Row>
        { cards }
      </Row>
    </div>
  );
}

export default connect(({events}) => ({events}))(Feed);