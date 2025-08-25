from flask import Blueprint

from models import get_user_models

api_bp = Blueprint('api', __name__)

existence = {
    'plenty': 1,
    'scarce': 2,
    'depleted': 3,
}

userdb = get_user_models('exampleuser')

@api_bp.route('/existence/<int:item_id>', methods=['PUT'])
def update_existence(item_id):
    pv = userdb.ProductVariant.get(userdb.ProductVariant.id == item_id)

    if pv.existence_id == 1:
        pv.existence_id = 2
    elif pv.existence_id == 2:
        pv.existence_id = 3
    elif pv.existence_id == 3:
        pv.existence_id = 1

    pv.save()

    return str(pv.existence_id), 200
