from peewee import (
    SqliteDatabase, Model,
    TextField, IntegerField, DecimalField, ForeignKeyField, BooleanField,
    SQL
)
from types import SimpleNamespace

from os import path

def get_user_models(username):

    assert username.isalnum() # No weird chars, no '/', etc should have passed
                              # validation

    filename = path.basename(f'{username}.db')
    directory = path.abspath(path.dirname(__file__))
    absolute_path = path.join(directory, 'db', filename)

    db = SqliteDatabase(absolute_path)
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

    class Counter(BaseModel):
        name = TextField(null=True)

        class Meta:
            table_name = 'counter'

    models.Counter = Counter

    class Existence(BaseModel):
        name = TextField(unique=True)

        class Meta:
            table_name = 'existence'

    models.Existence = Existence

    class Presentation(BaseModel):
        is_individual = BooleanField()
        name = TextField(unique=True)

        class Meta:
            table_name = 'presentation'

    models.Presentation = Presentation

    class Product(BaseModel):
        name = TextField(unique=True)

        class Meta:
            table_name = 'product'

    models.Product = Product

    class ProductVariant(BaseModel):
        brand = TextField(constraints=[SQL("DEFAULT 'no_brand'")])
        color = IntegerField(constraints=[SQL("DEFAULT 'no_color'")])
        existence = ForeignKeyField(column_name='existence_id', constraints=[SQL("DEFAULT 1")], field='id', model=Existence)
        package_content_id = IntegerField(null=True)
        package_is_top = BooleanField(constraints=[SQL("DEFAULT TRUE")])
        package_size = IntegerField(constraints=[SQL("DEFAULT 1")])
        presentation = ForeignKeyField(column_name='presentation_id', constraints=[SQL("DEFAULT 1")], field='id', model=Presentation)
        price = DecimalField(null=True)
        product = ForeignKeyField(column_name='product_id', field='id', model=Product)
        tamano = TextField(constraints=[SQL("DEFAULT 'no_tamano'")])

        class Meta:
            table_name = 'product_variant'
            indexes = (
                (('product', 'brand', 'presentation', 'package_size', 'package_content_id', 'color', 'tamano'), True),
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
