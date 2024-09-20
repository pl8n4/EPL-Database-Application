from DTO_models.fixtureDTO import fixtureDTO
from extensions import db
from models.match import Match
from models.team import Team
from sqlalchemy.orm import aliased

from datetime import datetime

def get_fixture_data():
    # Create aliases for joining the Team table twice
    home_team = aliased(Team)
    away_team = aliased(Team)

    # Query to fetch matches and join with teams to get both home and away team names
    fixtures = db.session.query(
        Match.MatchID,
        Match.HomeTeamID,
        Match.AwayTeamID,
        Match.Date,
        Match.Result,
        home_team.TeamName.label("HomeTeamName"),  # Join to get the home team name
        away_team.TeamName.label("AwayTeamName")   # Join to get the away team name
    ).join(
        home_team, Match.HomeTeamID == home_team.TeamID  # Join with home team alias
    ).join(
        away_team, Match.AwayTeamID == away_team.TeamID  # Join with away team alias
    ).all()

    fixture_dtos = []
    
    for fixture in fixtures:
        # Determine if the match has been played
        played = fixture.Result is not None

        # Convert date to timestamp by combining date with time (00:00:00)
        if fixture.Date:
            date_timestamp = datetime.combine(fixture.Date, datetime.min.time()).timestamp()
        else:
            date_timestamp = None

        # Map data to fixtureDTO
        fixture_dto = fixtureDTO(
            fixtureID=fixture.MatchID,
            homeTeam=fixture.HomeTeamName,
            awayTeam=fixture.AwayTeamName,
            date=date_timestamp,  # Send date as a timestamp (Double)
            played=played,
            result=fixture.Result if played else None  # Include result if the match has been played
        )
        
        fixture_dtos.append(fixture_dto)

    return fixture_dtos
