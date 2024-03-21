# English Premier League Database Application

## Description

This application provides a command-line interface to interact with the English Premier League (EPL) database. It allows users to view team rosters along with contract details, list players by goals or assists, and view all past and upcoming fixtures for the 22/23 season.

## Interface Features

- Pre-made queries to retrieve information in table format
- Option to use custom queries DISCLAIMER: Opens up a lot of risk in terms of SQL injections and data integrity as proper safeguards have not been implemented
- Option to export querie results to a csv file

## Prerequisites

Before running this application, ensure you have the following:

- Python
- MySQL server running on your local machine or a remote server
- `mysql-connector-python` installed in your Python environment
- 'tabulate' Python library installed in your Python enviornment

## Database Setup

You need to use the EPL_dump.sql file and import it into mySQL Workbech or make a SQL schema with a similar structure
For help with importing the sql file you can refer to this video: https://www.youtube.com/watch?v=JgUuR67zvQg

## Application Setup and Use

You don't need to do any setup before running the application aside from setting up the database
Once you run it, enter in the correct information for host, user, password, and database with your MySQL server details as it instructs you
Use the text-based menu to navigate the different possible queries
