from models.player import Player
from models.team import Team
from models.contract import Contract
from models.scorer_assister import Scorer, Assister
from DTO_models.playerDTO import playerDTO
from extensions import db

# Queries the database with SQL Alchemy
def get_players_with_stats():
    # Query the playe
    players = db.session.query(
        Player.PlayerID,
        Player.Fname,
        Player.Lname,
        Player.DOB,
        Player.Position,
        Team.TeamID,
        Team.TeamName,
        Player.Nationality,
        db.func.coalesce(db.func.sum(Scorer.NumOfGoals), 0).label('total_goals'),
        db.func.coalesce(db.func.sum(Assister.NumOfAssists), 0).label('total_assists')
    ).join(Contract, Player.PlayerID == Contract.PlayerID) \
     .join(Team, Contract.TeamID == Team.TeamID) \
     .outerjoin(Scorer, Player.PlayerID == Scorer.PlayerID) \
     .outerjoin(Assister, Player.PlayerID == Assister.PlayerID) \
     .group_by(Player.PlayerID, Team.TeamID, Team.TeamName, Player.DOB).all()

    # Map the results to PlayerDTO
    player_dtos = [
        playerDTO(
            playerID=player.PlayerID,
            playerName=f"{player.Fname} {player.Lname}",
            teamID=player.TeamID,
            teamName=player.TeamName,
            goals=int(player.total_goals) if player.total_goals else 0,  # Ensure safe conversion
            assists=int(player.total_assists) if player.total_assists else 0,  # Handle assists similarly
            position=player.Position,
            DOB=player.DOB.isoformat() if player.DOB else None,
            nationality=player.Nationality
        )
        for player in players
    ]

    return player_dtos
