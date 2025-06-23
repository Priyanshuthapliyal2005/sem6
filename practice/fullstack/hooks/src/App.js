import logo from './logo.svg';
import './App.css';
import React from 'react';
import Counter from './components/useState/counter';
import Weather from './components/useEffect/weather';
function App() {
  return (
    <div className="App">
      <header className="App-header">
        {Counter()}

        {Weather()}
      </header>
    </div>
  );
}

export default App;
