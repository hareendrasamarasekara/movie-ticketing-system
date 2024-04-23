// App.js
import React from 'react';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import HomePage from './components/HomePage';
import MovieDetailPage from './components/MovieDetailPage';
import BookingPage from './components/BookingPage';
import AuthPage from './components/AuthPage';
import NewMoviePage from './components/NewMoviePage';

function App() {
  return (
    <Router>
      <Switch>
        <Route path="/" exact component={HomePage} />
        <Route path="/movies/:movieId" component={MovieDetailPage} />
        <Route path="/booking/:movieId" component={BookingPage} />
        <Route path="/auth" component={AuthPage} />
        <Route path="/admin" component={NewMoviePage} />
      </Switch>
    </Router>
  );
}

export default App;
