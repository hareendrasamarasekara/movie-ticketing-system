// Header.js
import React from 'react';
import { Link } from 'react-router-dom';
import '../styles/Header.css'; // Import CSS file for styling

const Header = () => {
  return (
    <header className="header">
      <div className="container">
        <h1 className="logo">Movie Ticket Booking</h1>
        <nav>
          <ul className="nav-links">
            <li><Link to="/" className="nav-link">Home</Link></li>
            <li><Link to="/admin" className="nav-link">Admin</Link></li>
            {/* Add more navigation links as needed */}
          </ul>
        </nav>
      </div>
    </header>
  );
};

export default Header;
