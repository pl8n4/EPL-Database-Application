from models.scorer_assister import Scorer,Assister
from flask import jsonify

#GET endpoints for Scorers and Assisters
def setup_scorer_routes(app):
    @app.route('/scorer', methods=['GET'])
    def get_scorers():
        scorers = Scorer.query.all()
        return jsonify([scorer.to_dict() for scorer in scorers])
    
def setup_assister_routes(app):
    @app.route('/assister', methods=['GET'])
    def get_assisters():
        assisters = Assister.query.all()
        return jsonify([assister.to_dict() for assister in assisters])
    
