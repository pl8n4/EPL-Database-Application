# English Premier League Database Application

## Description

This application provides an iOS UI to interact with an English Premier League Database. It allows users to view league standings, past and upcoming fixtures, team info, and player stats for sample matches from the 22/23 season.

## Interface Features

- View English Premier League team standings
- Track player statistics such as goals, assists, and positions
- View upcoming and past fixtures with results
- Filter fixtures by played/unplayed status
- View detailed match statistics for each game

## Technologies Used

### Backend
- **Python** with **Flask** for the API
- **SQLAlchemy** for ORM (Object Relational Mapping)
- **MySQL** database for storing player, team, match, and fixture data
- **SQLAlchemy Aliases** for complex database queries
- **Flask's built-in server** for running the backend locally

### Frontend
- **SwiftUI** for creating the iOS user interface
- **Combine** for handling data bindings and reactive programming in Swift
- **Alamofire** or **URLSession** for making API requests to the Flask backend


# Installation

## Backend Setup
1. Clone the repository
2. Create a virtual environment and activate it
3. Install dependencies:
    - Found in requirements.txt
4. Set up your MySQL database:
    - Ensure MySQL is installed on your system. Then import the provided EPL_dump.sql file:
    - mysql -u yourusername -p epl_database < EPL_dump.sql
5. Change app.py file to your SQL credentials 

## Frontend (iOS) Setup
1. Open the Xcode project:
2. Add necessary dependancies if needed (Alamofire)

## Running the iOS App

1. Run the app.py file in the backend and ensure the endpoints are updated
2. Build and run the app on a simulator

The app should now be fetching data from your Flask backend and displaying team standings, player stats, and fixtures.
