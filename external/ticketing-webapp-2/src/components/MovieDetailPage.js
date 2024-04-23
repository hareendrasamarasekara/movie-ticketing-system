// MovieDetailPage.js
import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import ReactPlayer from 'react-player';
import '../styles/MovieDetailPage.css'; // Import CSS file for styling
import Header from './Header';

const MovieDetailPage = () => {
  const { movieId } = useParams();
  const [movie, setMovie] = useState(null);

  const serviceURL = window?.configs?.serviceURL ? window.configs.serviceURL : "/";

  useEffect(() => {
    fetchMovie();
  }, [movieId]);

  const fetchMovie = async () => {
    try {
      const response = await fetch(serviceURL + `/movie/${movieId}`);
      const data = await response.json();
      setMovie(data);
    } catch (error) {
      console.error('Error fetching movie:', error);
    }
  };

  if (!movie) {
    return <div>Loading...</div>;
  }

  return (
    <div className="movie-detail-page">
      <Header/>
      <h1>{movie.title}</h1>
      <div className="movie-details-container">
        <div className="movie-image">
          <img src={movie.imageUrl} alt={movie.title} />
        </div>
        <div className="trailer">
          <ReactPlayer
            url={movie.trailerUrl}
            controls
            width="100%"
            height="80%"
          />
          <div className="description">
            <h2>Description</h2>
            <p>{movie.description}</p>
          </div>
        </div>
      </div>
    </div>
  );
};

export default MovieDetailPage;
