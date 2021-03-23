import { useState, useEffect } from 'react';

import "./App.scss";
import Users from "./Users";

function App() {
  const [users, setUsers] = useState([]);

  useEffect(() => {
    if (users.length === 0) {
      fetchUsers().then((xs) => setUsers(xs));
    }
  }, [users]);

  return (
    <container>
      <Users users={users} />
    </container>
  );
}

export default App;