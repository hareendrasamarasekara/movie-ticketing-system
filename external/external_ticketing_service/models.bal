
type Movie record {|
    string id;
    string title;
    string description;
    string imageUrl;
    string genre;
    string trailerUrl;
    boolean active;
    string releaseDate;
    int duration; // in minutes
|};

type Location record {|
    string id;
    string name;
    string address;
    boolean active;
|};

type Theatre record {|
    string id;
    string name;
    string description;
    Location location;
    boolean active;
    int totalSeats;
    int remainingSeats;
|};

type ShowTime record {|
    string id;
    Movie movie;
    Theatre theatre;
    string startTime;
    string endTime;
    string language;
|};

type User record {|
    string id;
    string email;
    string name;
    string phone;
|};

type Ticket record {|
    string id;
    User user;
    string date;
    ShowTime showTime;
    string seats;
    float amount;
    string paymentConfirmation;
|};
