import React from 'react';

function Msg({name,section}){
    return(
        <div>
            <h1>Welcome {name} from {section} to our basic course.</h1>
        </div>
    );
};

export default Msg;