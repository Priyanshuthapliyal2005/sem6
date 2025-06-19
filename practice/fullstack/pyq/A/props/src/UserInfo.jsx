import React from "react";
import { useState } from "react";

function UserInfo({ onSubmit }){
    const [name, setName] = useState("");
    const [section, setSection] = useState("");

    function handleSubmit(e) {
        e.preventDefault();
        // Call the onSubmit prop function with the form data
        if (onSubmit) {
            onSubmit({name, section});
        }
        console.log("Form submitted:", {name, section});
        setName("");
        setSection("");
    }

    return (
        <div>
            <h1> User Info</h1>
            <form onSubmit={handleSubmit}>
                <input type="text" placeholder="name" value={name} onChange={(e) =>setName(e.target.value)}/>
                <input type="text" placeholder="section" value={section} onChange={(e) =>setSection(e.target.value)}/>
                <button type="submit">Submit</button>
            </form>
        </div>
    );
};

export default UserInfo;