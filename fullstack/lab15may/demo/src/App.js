import logo from './logo.svg';
import './App.css';
import { useState } from 'react';

function Counter() {
  const [count, setCount] = useState(0);

  const handleIncrement = () => {
    setCount(count + 1);
  };

  const handleDecrement = () => {
    setCount(count - 1);
  };

  return (
    <div className="counter-container">
      <h1>Counter</h1>
      <p className="count-display">{count}</p>
      <div className="button-container">
        <button onClick={handleIncrement}>Increment</button>
        <button onClick={handleDecrement}>Decrement</button>
      </div>
    </div>
  );
}

function App() {
  return (
    <div className="App">
      <header>
        <p>Hi I am a React app</p>
        <Counter />
      </header>
    </div>
  );
}

export default App;
