from flask import Blueprint, render_template

from models import get_user_models
import utils.db_constants as dbc

web_bp = Blueprint('web', __name__)

existence = {
    'plenty': 1,
    'scarce': 2,
    'depleted': 3,
}

userdb = get_user_models('exampleuser')

@web_bp.route('/')
def main():
    formatted_variants = []
    query =(
        userdb.ProductVariant.select()
        .where(userdb.ProductVariant.package_content_id.is_null(True))
    )

    headers = ('Producto', 'Precio', 'Existencias')
    for variant in query:

        str_variant = f'{variant.product.name}'

        if variant.brand != dbc.NO_BRAND:
            str_variant += f' {variant.brand}'

        if variant.color != dbc.NO_COLOR:
            str_variant += f' {variant.color}'

        if variant.tamano != dbc.NO_TAMANO:
            str_variant += f' {variant.tamano}'

        fvariant = {
            'str_variant': str_variant,
            'price': f'${variant.price:.2f}',
            'existence': variant.existence.id
        }
        formatted_variants.append(fvariant)


    return render_template('product_list.html',
                           headers=headers,
                           formatted_variants=formatted_variants,
                           existence=existence)
