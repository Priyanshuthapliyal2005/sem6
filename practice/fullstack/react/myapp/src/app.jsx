import React from 'react';
import './App.css';
import Counter from '../src/components/conter';
function App() {
    return (
        <div className="App">
            <header className="App-header">
                <h1>Counter Application</h1>
                <Counter />
            </header>
        </div>
    )
}

export default App;