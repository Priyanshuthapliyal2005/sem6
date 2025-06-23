import react, { use } from 'react';
import { useState, useEffect } from 'react';

function Weather() {
    const [weather,setWeather] = useState(null);
    const [city,setCity] = useState('');
    const [suggestions, setSuggestions] = useState([]);
    const [showDropdown,setShowDropdown] = useState(false);    
    useEffect(() => {
        const timeout = setTimeout(()=>{
            if(city.length > 2) {
                fetchCitySuggestions();
            } else {
                setSuggestions([]);
                setShowDropdown(false);
            }
        }, 300);
        return () => clearTimeout(timeout);
    }, [city]);
    async function fetchCitySuggestions() {
        const res = await fetch(`https://geocoding-api.open-meteo.com/v1/search?name=${city}&count=5`);
        const data = await res.json();
        if(data.results && data.results.length > 0) {
            setSuggestions(data.results);
            setShowDropdown(true);
        }
        else {
            setSuggestions([]);
            setShowDropdown(false);
        }    }
    
    async function fetchWeatherForSelected(selectedCity) {
        const weatherRes = await fetch(`https://api.open-meteo.com/v1/forecast?latitude=${selectedCity.latitude}&longitude=${selectedCity.longitude}&current_weather=true`);
        const weatherData = await weatherRes.json();
        if(!weatherData.current_weather) {
            setWeather(null);
            return;
        }
        setWeather(weatherData.current_weather);
    }
    // useEffect is a hook that allows you to perform side effects in function components

    // use Effect is used to fetch weather data whenever the city changes
    // It will fetch the weather data from the Open Meteo API based on the city name
    // If the city is not provided, it will not fetch any data
    // If the city is not found, it will set the weather to null
    // If the weather data is not available, it will set the weather to null
    // If the weather data is available, it will set the weather to the current weather data
    // The weather data will be displayed in the component
    // The component will re-render whenever the weather data changes   
    // The component will re-render whenever the city changes

    async function fetchWeather(){
        if(!city)return;
        const geoRes = await fetch(`https://geocoding-api.open-meteo.com/v1/search?name=${city}&count=5`);
        const geoData = await geoRes.json();
        if(!geoData.results || geoData.results.length === 0) {
            setWeather(null);
            return;
        }
        const {latitude, longitude} = geoData.results[0];

        const weatherRes  = await fetch(`https://api.open-meteo.com/v1/forecast?latitude=${latitude}&longitude=${longitude}&current_weather=true`);

        const weatherData = await weatherRes.json();
        if(!weatherData.current_weather) {
            setWeather(null);
            return;
        }
        setWeather(weatherData.current_weather);
    }    return (
        <div>
            <h1> Weather App</h1>
            <div style={{position: 'relative', width: '300px'}}>
                <input type="text" value={city} onChange={(e) => setCity(e.target.value)} placeholder="Enter city name" />
                {showDropdown && (
                    <div style={{position: 'absolute', top: '100%', left: 0, right: 0, backgroundColor: 'white', border: '1px solid #ccc', maxHeight: '200px', overflowY: 'auto', zIndex: 1000}}>                        {suggestions.map((suggestion, index) => (
                            <div key={index} onClick={() => {
                                setCity(suggestion.name + ', ' + suggestion.country); 
                                setShowDropdown(false);
                                fetchWeatherForSelected(suggestion);
                            }} style={{padding: '10px', cursor: 'pointer', borderBottom: '1px solid #eee'}}>
                                {suggestion.name}, {suggestion.country}
                            </div>
                        ))}
                    </div>
                )}
                <button onClick={fetchWeather}>Get Weather</button>
            </div>
            {weather ? (
                <div>
                    <h2> Current temperature is {weather.temperature}</h2>
                    <h2> Wind speed is {weather.windspeed}</h2>
                    <h2> Wind direction is {weather.winddirection}</h2>
                </div>
            ) : (
                <h2> No weather data available. Please enter a valid city name.</h2>
            )}
        </div>
    );
}

export default Weather;