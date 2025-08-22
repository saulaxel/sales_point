from peewee import (
    SqliteDatabase, Model,
    TextField, IntegerField, DecimalField, ForeignKeyField,
    SQL
)
from types import SimpleNamespace

def get_user_models(username):

    assert username.isalnum() # No weird chars, no '/', etc should have passed
                              # validation

    db = SqliteDatabase(f'db/{username}.db')
    models = SimpleNamespace()

    class UnknownField(object):
        def __init__(self, *_, **__): pass

    models.UnknownField = UnknownField

    class BaseModel(Model):
        class Meta:
            database = db

    models.BaseModel = BaseModel

    class Color(BaseModel):
        name = TextField(unique=True)

        class Meta:
            table_name = 'color'

    models.Color = Color

    class Product(BaseModel):
        name = TextField(unique=True)

        class Meta:
            table_name = 'product'

    models.Product = Product

    class ProductPackaging(BaseModel):
        name = TextField(unique=True)

        class Meta:
            table_name = 'product_packaging'

    models.ProductPackaging = ProductPackaging

    class ProductVariant(BaseModel):
        brand = TextField(constraints=[SQL("DEFAULT 'no_brand'")])
        color = IntegerField(constraints=[SQL("DEFAULT 'no_color'")])
        package_size = IntegerField(constraints=[SQL("DEFAULT 1")])
        price = DecimalField()
        product = ForeignKeyField(column_name='product_id', field='id', model=Product)
        product_packaging = ForeignKeyField(column_name='product_packaging_id', constraints=[SQL("DEFAULT 1")], field='id', model=ProductPackaging)
        tamano = TextField(constraints=[SQL("DEFAULT 'no_tamano'")])

        class Meta:
            table_name = 'product_variant'
            indexes = (
                (('product', 'brand', 'product_packaging', 'color', 'tamano'), True),
            )

    models.ProductVariant = ProductVariant

    class ProviderPrice(BaseModel):
        price = DecimalField()
        product_variant = ForeignKeyField(column_name='product_variant_id', field='id', model=ProductVariant)
        provider = TextField(constraints=[SQL("DEFAULT 'unknown'")])

        class Meta:
            table_name = 'provider_price'
            indexes = (
                (('product_variant', 'provider'), True),
            )

    models.ProviderPrice = ProviderPrice

    return models

if __name__ == '__main__':
    models = get_user_models('exampleuser')
