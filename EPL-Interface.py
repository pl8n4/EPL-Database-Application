import mysql.connector
import csv
from tabulate import tabulate
import os
import re

def connect_to_db(host, user, password, database):
    
    try:
        db = mysql.connector.connect(
            host = host,
            user = user,
            passwd = password,
            database = database
            )
        return db
    except mysql.connector.Error as e:
        print(f"Error connecting to MySQL Database: {e}")
        return None
    
def export_to_csv(data, headers):
    export = input("Would you like to export this data into a csv file? (y/n): ")
    if export.lower() != 'y':
        return
    filename = input("Enter name for the file (without extensions): ") + '.csv'
    filename = sanitize_filename(filename)
    with open(filename, "w", newline = '', encoding='utf-8') as csvfile:
        csvwriter = csv.writer(csvfile)
        csvwriter.writerow(headers)
        csvwriter.writerows(data)

def sanitize_filename(filename):
    filename = re.sub(r'[<>:"/\\|?*]', '', filename)
    filename = filename.replace(' ', '_')
    filename = filename[:255]
    filename = filename.lstrip(".")
    filename = os.path.basename(filename)

    return filename

def teams_players_contract_q(mycursor):
    print("\nTeams and their Players:\n")
    query = """
    SELECT 
        CONCAT(PLAYER.Fname, ' ', PLAYER.Lname) AS PlayerName,
        TEAM.TeamName,
        PLAYER.Position,
        CONTRACT.Value AS ContractValue,
        CONTRACT.StartDate,
        CONTRACT.EndDate
    FROM 
        PLAYER 
    JOIN 
        PLAYS_FOR ON PLAYER.PlayerID = PLAYS_FOR.PlayerID
    JOIN 
        TEAM ON PLAYS_FOR.TeamID = TEAM.TeamID
    JOIN 
        CONTRACT ON PLAYER.PlayerID = CONTRACT.PlayerID AND TEAM.TeamID = CONTRACT.TeamID;
    """
    mycursor.execute(query)
    headers = ["Player", "Team", "Position", "Contract Value", "Start Date", "End Date"]
    rows = mycursor.fetchall()
    table = tabulate(rows, headers, tablefmt='psql')     
    print(table)
    export_to_csv(rows, headers) 

def players_by_goals_q(mycursor):
    query = """
    SELECT 
        CONCAT(PLAYER.Fname, ' ', PLAYER.Lname) AS PlayerName,
        TEAM.TeamName,
        SUM(SCORERS.NumOfGoals) AS TotalGoals
    FROM 
        SCORERS 
    JOIN 
        PLAYER ON SCORERS.PlayerID = PLAYER.PlayerID
    JOIN 
        PLAYS_FOR ON PLAYER.PlayerID = PLAYS_FOR.PlayerID
    JOIN 
        TEAM ON PLAYS_FOR.TeamID = TEAM.TeamID
    GROUP BY 
        SCORERS.PlayerID, TEAM.TeamName
    ORDER BY 
        TotalGoals DESC, PlayerName;
    """
    mycursor.execute(query)
    headers = ['Player Name', 'Team Name', 'Total Goals']
    rows = mycursor.fetchall()
    table = tabulate(rows, headers, tablefmt='psql')     
    print(table)

def players_by_assists_q(mycursor):
    print("\nPlayers sorted by assists:\n")
    query = """
    SELECT 
        CONCAT(PLAYER.Fname, ' ', PLAYER.Lname) AS PlayerName, TEAM.TeamName,
        SUM(ASSISTERS.NumOfAssists) AS TotalAssists
    FROM
        ASSISTERS
    JOIN 
        PLAYER ON ASSISTERS.PlayerID = PLAYER.PlayerID
    JOIN
        PLAYS_FOR ON PLAYER.PlayerID = PLAYS_FOR.PlayerID
    JOIN
        TEAM ON PLAYS_FOR.TeamID = TEAM.TeamID
    GROUP BY
        ASSISTERS.PlayerID, TEAM.TeamName
    ORDER BY
         TotalAssists DESC, PlayerName
    """
    mycursor.execute(query)  
    headers = ['Player Name', 'Team Name', 'Total Assists']
    rows = mycursor.fetchall()
    table = tabulate(rows, headers, tablefmt='psql')     
    print(table)
    export_to_csv(rows, headers) 

def fixtures_q(mycursor):
    print("\nFixtures:\n")
    query = """
    SELECT 
        M.Date, 
        HT.TeamName AS HomeTeam, 
        AT.TeamName AS AwayTeam, 
        M.Result
    FROM 
        `MATCH` M
    JOIN 
        TEAM HT ON M.HomeTeamID = HT.TeamID
    JOIN 
        TEAM AT ON M.AwayTeamID = AT.TeamID
    ORDER BY 
        M.Date;
    """
    mycursor.execute(query) 
    headers = ['Date', 'Home Team', 'Away Team', 'Result']
    rows = mycursor.fetchall()
    table = tabulate(rows, headers, tablefmt='psql')     
    print(table)
    export_to_csv(rows, headers) 

def custom_q(mycursor):
    c2 = "y"
    while c2.lower() == "y":
        try:
            query = input("\nInput your custom query (SELECT only): ")
            if not query.lower().startswith('select'):
                raise ValueError("Only SELECT queries are allowed.")    
            mycursor.execute(query)
            rows = mycursor.fetchall()
            columns = mycursor.column_names
            
            print(tabulate(rows, columns, tablefmt='psql'))     
            export_to_csv(rows, columns)
            c2 = input("Would you like to do another custom query? (y/n): ")
        
        except (mysql.connector.Error, ValueError) as err:
            print("\nSomething went wrong: {}".format(err))
            c2 = input("Would you like to try again? (y/n): ")

def print_menu(mycursor):
    while True:
        print("\n-----MENU-----\n")
        print("1. List all teams and their players with contract information")
        print("2. List players by goals")
        print("3. List players by assits")
        print("4. List all the fixtures")
        print("5. Create custom SQL query")
        print("6. Exit")
        choice = input("Select your choice (1, 2, 3, 4, or 5): ")

        if choice == "1":
            teams_players_contract_q(mycursor)
        elif choice == "2":
            players_by_goals_q(mycursor)
    
        elif choice == "3":
            players_by_assists_q(mycursor)
    
        elif choice == "4":
            fixtures_q(mycursor)
        
        elif choice == "5":
            custom_q(mycursor)

        elif choice == "6":
            print("Exiting program.")
            return
        else:
            print("Invalid option, please pick 1, 2, 3, 4, or 5.")

def main():
    db = None
    
    while db is None:

        host = input("\nHost: ")
        user = input("Username: ")
        password = input("Password: ")
        database = input("Database: ")
        db = connect_to_db(host, user, password, database)

    mycursor = db.cursor()
    print_menu(mycursor)
    mycursor.close()
    db.close()




main()