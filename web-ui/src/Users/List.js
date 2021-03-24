import { Row, Col } from 'react-bootstrap';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';

function photo_path(user) {
  return "http://localhost:4000/photos/" + user.photo_hash;
}

function UsersList({users}) {
  let rows = users.map((user) => (
    
    <tr key={user.id}>
      <td>
        <img className="minipic" alt="Profile" src={photo_path(user)}></img>
      </td>
      <td>{user.name}</td>
      <td>[Edit]</td>
    </tr>
  ));

  return (
    <div>
      <Row>
        <Col>
          <h2>List Users</h2>
          <p>
            <Link to="/users/new">
              New User
            </Link>
          </p>
          <table className="table table-striped">
            <thead>
              <tr>
                <th>Profile Picture</th>
                <th>Name</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              { rows }
            </tbody>
          </table>
        </Col>
      </Row>
    </div>
  );
}

function state2props({users}) {
  return { users };
}

export default connect(state2props)(UsersList);