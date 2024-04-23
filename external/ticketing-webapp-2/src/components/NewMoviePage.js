// NewMoviePage.js
import React, { useState } from 'react';
import Header from './Header';
import '../styles/NewMoviePage.css'; // Import CSS file for styling

const NewMoviePage = () => {
  const [formData, setFormData] = useState({
    title: '',
    description: '',
    imageUrl: '',
    genre: '',
    trailerUrl: '',
    releaseDate: '',
    duration: 0,
  });

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData(prevState => ({
      ...prevState,
      [name]: value
    }));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const response = await fetch('/movie', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(formData),
      });
      if (response.ok) {
        // Movie added successfully
        console.log('Movie added successfully');
      } else {
        // Error adding movie
        console.error('Error adding movie');
      }
    } catch (error) {
      console.error('Error adding movie:', error);
    }
  };

  return (
    <div>
      <Header />
      <div className="container">
        <h2>Add New Movie</h2>
        <form onSubmit={handleSubmit}>
          <div className="form-group">
            <label>Title:</label>
            <input type="text" name="title" value={formData.title} onChange={handleChange} required />
          </div>
          <div className="form-group">
            <label>Description:</label>
            <textarea name="description" value={formData.description} onChange={handleChange} required />
          </div>
          <div className="form-group">
            <label>Image URL:</label>
            <input type="text" name="imageUrl" value={formData.imageUrl} onChange={handleChange} required />
          </div>
          <div className="form-group">
            <label>Genre:</label>
            <input type="text" name="genre" value={formData.genre} onChange={handleChange} required />
          </div>
          <div className="form-group">
            <label>Trailer URL:</label>
            <input type="text" name="trailerUrl" value={formData.trailerUrl} onChange={handleChange} required />
          </div>
          <div className="form-group">
            <label>Release Date:</label>
            <input type="date" name="releaseDate" value={formData.releaseDate} onChange={handleChange} required />
          </div>
          <div className="form-group">
            <label>Duration (minutes):</label>
            <input type="number" name="duration" value={formData.duration} onChange={handleChange} required />
          </div>
          <button type="submit">Submit</button>
        </form>
      </div>
    </div>
  );
};

export default NewMoviePage;
