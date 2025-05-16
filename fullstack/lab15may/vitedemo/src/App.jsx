import { useState } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'
import './App.css'

function App() {
  const [count, setCount] = useState(0)

  const increment = () => {
    setCount(count + 1)
  };

  const decrement = () => {
    setCount(count - 1)
  };

  const reset = () => {
    setCount(0)
  };

  return (
    <>    
      <div className="card">
        <h1>Counter</h1>
        <p className="count-display">{count}</p>
        <div className="button-container">
          <button onClick={increment}>Increment</button>
          <button onClick={decrement}>Decrement</button>
          <button onClick={reset}>Reset</button>
        </div>
      </div>
    </>
  )
}

export default App
