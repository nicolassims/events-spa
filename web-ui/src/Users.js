import { connect } from 'react-redux';
import { Row, Col, Form, Button } from 'react-bootstrap';
import capitalize from 'lodash/capitalize';

function Field({user, setUser, field}) {
  function update(ev) {
    let tmp = Object.assign({}, user);
    tmp[field] = ev.target.value;
    setUser(tmp);
  }

  return (
    <Form.Group>
      <Form.Label>{capitalize(field)}</Form.Label>
      <Form.Control type="text" onChange={update} value={user[field]||""} />
    </Form.Group>
  );
}

function photo_path(user) {
  return "http://localhost:4000/photos/" + user.photo_hash;
}

function UserForm({user, setUser}) {
  function onSubmit(ev) {
    ev.preventDefault();
    console.log(ev);
    console.log(user);
  }

  return (
    <Form onSubmit={onSubmit}>
      <Field user={user} setUser={setUser} field="name" />
      <Button variant="primary" type="submit">
        Save
      </Button>
    </Form>
  );
}

function Users({users, user_form, dispatch}) {

  function setUser(user) {
    dispatch({type: 'user_form/set', data: user})
  }

  let rows = users.map((user) => (
    
    <tr key={user.id}>
      <td>
        <img className="minipic" alt="Profile" src={photo_path(user)}></img>
      </td>
      <td>{user.name}</td>
      <td>
        <Button variant="secondary" onClick={() => setUser(user)}>
          Edit
        </Button>
      </td>
    </tr>
  ));

  return (
    <div>
      <Row>
        <Col>
          <h2>List Users</h2>
          <p>
            <Button variant="secondary"
                    onClick={() => setUser({})}>
              New User
            </Button>
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
      <Row>
        <Col>
          <h2>Edit User</h2>
          <UserForm user={user_form} setUser={setUser} />
        </Col>
      </Row>
    </div>
  );
}

export default connect(({users, user_form}) => ({users, user_form}))(Users);