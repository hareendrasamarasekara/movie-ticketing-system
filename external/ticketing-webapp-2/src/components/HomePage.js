// Header.js
import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import Header from './Header';
import '../styles/HomePage.css';

const HomePage = () => {
  const [movies, setMovies] = useState([]);

  const serviceURL = window?.configs?.serviceURL ? window.configs.serviceURL : "/";

  useEffect(() => {
    fetchMovies();
  }, []);

  const fetchMovies = async () => {
    try {
      const response = await fetch(serviceURL + '/movie');
      const data = await response.json();
      setMovies(data);
    } catch (error) {
      console.error('Error fetching movies:', error);
    }
  };

  return (
    <div>
      <Header />

      <div className="main-content">
        <h2>Available Movies</h2>
        <div className="movie-container">
          {movies.map(movie => (
            <div key={movie.id} className="movie-box">
              <Link to={`/movies/${movie.id}`}>
                <img src={movie.imageUrl} alt={movie.title} />
                <p>{movie.title}</p>
              </Link>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};

export default HomePage;
