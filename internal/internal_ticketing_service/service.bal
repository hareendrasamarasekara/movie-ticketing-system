import ballerina/http;
import ballerina/log;

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {

    resource function get movies() returns Movie[]|error {

        log:printInfo("Get movie hit");
        
        Movie movie = {
            id: "001",
            title: "Civil War",
            description: "In a dystopian future America, a team of military-embedded journalists races against time to reach Washington, D.C., before rebel factions descend upon the White House.",
            image: "",
            genre: "Action",
            trailer: "https://www.youtube.com/watch?v=c2G18nIVpNE",
            active: true,
            releaseDate: "04/12/2024",
            duration: 109
        };

        return [
            movie
        ];
    }
}
