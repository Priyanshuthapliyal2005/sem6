import react from 'react';
import {useState} from 'react';

function Counter(){
    const [cnt,setCnt] = useState(0);
    const inc = () => {
        setCnt(cnt + 1);
    }
    const dec = () => {
        setCnt(cnt - 1);
    }

    return (
        <div>
            <h1>Counter</h1>
            <h2>{cnt}</h2>
            <button onClick={inc}>Increment</button>
            <button onClick={dec}>Decrement</button>
            <button onClick={() => setCnt(0)}>Reset</button>
        </div>
    );
};

export default Counter;