import React from 'react';


function Display({name, section}){
    return (
        <div>
            <h1>Display Component</h1>
            <p>Name: {name}</p>
            <p>Section: {section}</p>
        </div>
    );
};

export default Display;