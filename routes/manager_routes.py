from models.manager import Manager
from flask import jsonify

# GET endpoint for Manager
def setup_manager_routes(app):
    @app.route('/managers', methods=['GET'])
    def get_manager():
        managers = Manager.query.all()
        return jsonify([manager.to_dict() for manager in managers])
