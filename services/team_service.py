from models.team import Team
from models.stadium import Stadium
from models.match import Match
from DTO_models.teamDTO import teamDTO
from extensions import db
from sqlalchemy import func

def get_team_data():
    # Fetch all teams
    teams = db.session.query(Team).all()

    team_dtos = []

    for team in teams:
        teamID = team.TeamID
        teamName = team.TeamName
        stadiumName = team.StadiumName

        # Fetch matches where the team is the home team
        home_matches = db.session.query(Match).filter(Match.HomeTeamID == teamID).all()

        # Fetch matches where the team is the away team
        away_matches = db.session.query(Match).filter(Match.AwayTeamID == teamID).all()

        # Initialize statistics
        matches_played = 0
        wins = 0
        draws = 0
        losses = 0
        scored_goals = 0
        conceded_goals = 0

        # Process home matches
        for match in home_matches:
            if match.Result:  # Only process matches that have a result
                matches_played += 1
                home_score_str, away_score_str = match.Result.split('-')
                home_score = int(home_score_str)
                away_score = int(away_score_str)

                scored_goals += home_score
                conceded_goals += away_score

                if home_score > away_score:
                    wins += 1
                elif home_score == away_score:
                    draws += 1
                else:
                    losses += 1

        # Process away matches
        for match in away_matches:
            if match.Result:  # Only process matches that have a result
                matches_played += 1
                home_score_str, away_score_str = match.Result.split('-')
                home_score = int(home_score_str)
                away_score = int(away_score_str)

                scored_goals += away_score
                conceded_goals += home_score

                if away_score > home_score:
                    wins += 1
                elif away_score == home_score:
                    draws += 1
                else:
                    losses += 1

        # Calculate points
        points = wins * 3 + draws

        # Create the DTO instance
        team_dto = teamDTO(
            teamID=teamID,
            teamName=teamName,
            stadiumName=stadiumName,
            matchesPlayed=matches_played,
            wins=wins,
            draws=draws,
            losses=losses,
            points=points,
            scoredGoals=scored_goals,
            concededGoals=conceded_goals
        )

        team_dtos.append(team_dto)

    return team_dtos
