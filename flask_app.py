
# A very simple Flask Hello World app for you to get started with...

from flask import Flask
from jinja2 import Environment, FileSystemLoader

from models import get_user_models
import db_constants as dbc

existence = {
    'plenty': 1,
    'scarce': 2,
    'depleted': 3,
}

app = Flask(__name__)
userdb = get_user_models('exampleuser')
jenv = Environment(loader=FileSystemLoader('templates/'))

@app.route('/')
def main():
    formatted_variants = []
    query =(
        userdb.ProductVariant.select()
        .where(userdb.ProductVariant.package_content_id.is_null(True))
    )

    template = jenv.get_template('product_list.html')
    # Columns as the user will read them
    headers = ('id', 'Producto', 'Precio', 'Existencias')
    for variant in query:

        str_variant = f'{variant.product.name}'

        if variant.brand != dbc.NO_BRAND:
            str_variant += f' {variant.brand}'

        if variant.color != dbc.NO_COLOR:
            str_variant += f' {variant.color}'

        if variant.tamano != dbc.NO_TAMANO:
            str_variant += f' {variant.tamano}'

        fvariant = {
            'id': variant.id,
            'str_variant': str_variant,
            'price': f'${variant.price:.2f}',
            'existence': variant.existence.id
        }
        formatted_variants.append(fvariant)


    return template.render(headers=headers,
                           formatted_variants=formatted_variants,
                           existence=existence)

if __name__ == '__main__':
    app.run(debug=True)
