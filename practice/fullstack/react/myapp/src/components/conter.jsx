import React, { useState, useRef, useEffect } from 'react';
import './cnt.css';

function Counter(){
    // State management
    const [cnt, setCnt] = useState(0);
    const [auto, setAuto] = useState(false);
    const [speed, setSpeed] = useState(1000); // milliseconds
    const [history, setHistory] = useState([]);
    const intervalRef = useRef(null);
    
    // Track counter history
    useEffect(() => {
        if (history.length > 0 && history[history.length - 1] === cnt) {
            return;
        }
        // Keep last 10 values
        setHistory(prev => [...prev.slice(-9), cnt]);
    }, [cnt]);
    
    // Handle increment with optional step
    function increment(step = 1) {
        setCnt(cnt + step);
    };

    // Handle decrement with optional step
    function decrement(step = 1) {
        setCnt(cnt - step);
    };

    // Reset counter and stop auto mode
    function reset(){
        setCnt(0);
        setAuto(false);
        if(intervalRef.current) {
            clearInterval(intervalRef.current);
        }
        intervalRef.current = null;
    }

    // Toggle auto counter mode
    function autonomous() {
        if(intervalRef.current) {
            // Stop auto mode
            clearInterval(intervalRef.current);
            intervalRef.current = null;
            setAuto(false);
            return;
        }
        // Start auto mode
        intervalRef.current = setInterval(() => {
            setCnt(prev => prev + 1);
        }, speed);
        setAuto(true);
    }    return(
        <div className='counter'>
            <div className='display'>
                <h1>{cnt}</h1>
                {auto && <div className="auto-indicator">Auto On</div>}
            </div>
            
            {/* Show recent history */}
            {history.length > 1 && (
                <div className="history">
                    <small>Recent values: {history.slice(0, -1).join(', ')}</small>
                </div>
            )}

            <div className='buttons'>
                <button 
                    onClick={() => increment()} 
                    disabled={auto}
                >
                    Increment
                </button>
                <button 
                    onClick={() => decrement()} 
                    disabled={auto}
                >
                    Decrement
                </button>
                <button onClick={reset}>Reset</button>
                <button 
                    onClick={autonomous}
                    className={auto ? 'auto-active' : ''}
                >
                    {auto ? 'Stop Auto' : 'Start Auto'}
                </button>
            </div>
            
            {/* Additional controls - only visible when auto is off */}
            {!auto && (
                <div className="extra-controls">
                    <button onClick={() => increment(5)}>+5</button>
                    <button onClick={() => increment(10)}>+10</button>
                    <button onClick={() => decrement(5)}>-5</button>
                </div>
            )}
        </div>
    );
};

export default Counter;