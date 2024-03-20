import mysql.connector
import csv


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
    
def export_to_csv(data, headers, filename):
    with open(filename, "w", newline = '', encoding='utf-8') as csvfile:
        csvwriter = csv.writer(csvfile)
        csvwriter.writerow(headers)
        csvwriter.writerows(data)
    
def print_menu(mycursor):
    while True:
        print("\n-----MENU-----\n")
        print("1. List all teams and their players with contract information")
        print("2. List players by goals")
        print("3. List players by assits")
        print("4. List all the fixtures")
        print("5. Exit")
        choice = input("Select your choice (1, 2, 3, 4, or 5): ")

        if choice == "1":
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
    CONTRACT ON PLAYER.PlayerID = CONTRACT.PlayerID AND TEAM.TeamID = CONTRACT.TeamID

        """
            mycursor.execute(query)
        
            rows = mycursor.fetchall()
            if rows:
                print("{:<30} {:<20} {:<15} {:<15} {:<15} {:<15}".format("Player", "Team", "Position", "Contract Value", "Start Date", "End Date"))
                print("-" * 115)
                headers = ['Player Name', 'Team Name', 'Position', 'Contract Value', 'Start Date', 'End Date']
                for player_name, team_name, player_position, contract_value, start_date, end_date in rows:
                    start_date_str = start_date.strftime("%Y-%m-%d") if start_date is not None else 'N/A'
                    end_date_str = end_date.strftime("%Y-%m-%d") if end_date is not None else 'N/A'
                    print("{:<30} {:<20} {:<15} {:<15} {:<15} {:<15}".format(player_name, team_name, player_position, contract_value, start_date_str, end_date_str))
                
                export = input("Would you like to export this data into a csv file?(y/n) ")
                if export.lower() == 'y':
                    filename = input("Enter name for the file (without extensions): ") + '.csv'
                    export_to_csv(rows, headers, filename)
                    print(f"Data exported to {filename}")
            else:
                print("No data found.")
    
        elif choice == "2":
            print("\nPlayers sorted by goals:\n")
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

            rows = mycursor.fetchall()
            headers = ['Player Name', 'Team Name', 'Total Goals']
            if rows:
                print("{:<30} {:<20} {}".format("Player Name", "Team Name", "Total Goals"))
                print("-" * 60)
                for player_name, team_name, total_goals in rows:
                    print("{:<30} {:<20} {}".format(player_name, team_name, total_goals))
                
                export = input("Would you like to export this data into a csv file?(y/n) ")
                if export.lower() == 'y':
                    filename = input("Enter name for the file (without extensions): ") + '.csv'
                    export_to_csv(rows, headers, filename)
                    print(f"Data exported to {filename}")
            else:
                print("No data found.")
    
        elif choice == "3":
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
            rows = mycursor.fetchall()
            headers = ['Player Name', 'Team Name', 'Total Assists']
            if rows:
                print("{:<30} {:<20} {}".format("Player Name", "Team Name", "Total Assists"))
                print("-" * 60)
                for player_name, team_name, total_assists in rows:
                    print("{:<30} {:<20} {}".format(player_name, team_name, total_assists))
                
                export = input("Would you like to export this data into a csv file?(y/n) ")
                if export.lower() == 'y':
                    filename = input("Enter name for the file (without extensions): ") + '.csv'
                    export_to_csv(rows, headers, filename)
                    print(f"Data exported to {filename}")
            else:
                print("No data found")
    
        elif choice == "4":
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

            rows = mycursor.fetchall()

            headers = ['Date', 'Home Team', 'Away Team', 'Result']
            if rows:
                print("{:<15} {:<25} {:<25} {:<10}".format("Date", "Home Team", "Away Team", "Result"))
                print("-" * 90)
                for date, home_team, away_team, result in rows:
                    date_str = date.strftime("%Y-%m-%d") if date is not None else 'N/A'
                    result_str = result if result is not None else 'N/A'
                    print("{:<15} {:<25} {:<25} {:<10}".format(date_str, home_team, away_team, result_str))
                
                export = input("Would you like to export this data into a csv file?(y/n) ")
                if export.lower() == 'y':
                    filename = input("Enter name for the file (without extensions): ") + '.csv'
                    export_to_csv(rows, headers, filename)
                    print(f"Data exported to {filename}")
            else:
                print("No data found")

        elif choice == "5":
            print("Exiting program.")
            break
        else:
            print("Invalid option, please pick 1, 2, 3, 4, or 5.")

def main():
    print("Welcome to the English Premier League Database!")
    host = input("Host: ")
    user = input("Username: ")
    password = input("Password: ")
    database = input("Database: ")
    db = connect_to_db(host, user, password, database)
    
    if db is not None:
        mycursor = db.cursor()
        print_menu(mycursor)
        mycursor.close()
        db.close()
    else:
        print("Failed to connect to the database.")




main()