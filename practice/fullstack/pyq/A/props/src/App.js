import logo from './logo.svg';
import './App.css';
import UserInfo from './UserInfo';
import Display from './display.jsx';  // Fixed extension and capitalization
import React, { useState } from 'react';

function App() {
  const [data, setData] = useState({name:"", section:""});  // Fixed naming convention

  function handleFormSubmit(formData) {
    setData(formData);
  };

  return(
    <div>
      <h1> Form Demo </h1>
      <UserInfo onSubmit={handleFormSubmit} />
      <Display name={data.name} section={data.section} />
    </div>
  );
};

export default App;