-- TABLE --
CREATE TABLE color (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

INSERT INTO color (
    name
) VALUES
    ('no_color'),
    ('red');


-- TABLE --
CREATE TABLE presentation (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    is_individual BOOLEAN NOT NULL
    -- Since 'box is a presentation that contains multiple elements
    -- is_individual is FALSE,
    -- 'piece' doesn't contain multiple elements, is_individual is TRUE
);

INSERT INTO presentation (
    name, is_individual
) VALUES
    ('piece' , TRUE),
    ('sheet' , TRUE),
    ('bottle', TRUE),
    ('box'  , FALSE),
    ('bag'  , FALSE),
    ('other', FALSE);

-- TABLE --
CREATE TABLE existence (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

INSERT INTO existence (
    name
) VALUES
    ('plenty'),
    ('scarce'),
    ('depleted');

-- TABLE --
CREATE TABLE counter (
    id INTEGER PRIMARY KEY,
    name TEXT
);

-- TABLE --
CREATE TABLE product (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);


-- TABLE --
CREATE TABLE product_variant (
    id INTEGER PRIMARY KEY,
    product_id INTEGER NOT NULL,


    brand TEXT NOT NULL DEFAULT 'no_brand',

    -- Several attributes define a linked list of product_variants, each
    -- containing the next like a Russian Matroska doll.
    --
    -- +---------------------------------------+
    -- |                                       |
    -- |   o-------------------------------o   |
    -- |   | +-------+ +-------+ +-------+ |   |
    -- |   | | candy | | candy | | candy | |   |
    -- |   | +-------+ +-------+ +-------+ |   |
    -- |   o--+----------------------------o   | presentation = 'box'
    -- |                                       | package_size = 2
    -- |   o-------------------------------o   | package_is_top = TRUE
    -- |   | +-------+ +-------+ +-------+ |   |
    -- |   | | candy | | candy | | candy | |   |
    -- |   | +-------+ +-------+ +-------+ |   |
    -- |   o--+----------------------------o   |
    -- |                                       |
    -- +----+----------------------------------+
    --    |
    --    | package_content_id = 'bag of candy'
    --    |
    --    v
    -- o-------------------------------o
    -- | +-------+ +-------+ +-------+ | presentation = 'bag'
    -- | | candy | | candy | | candy | | package_size = 3
    -- | +-------+ +-------+ +-------+ | package_is_top = FALSE
    -- o--+----------------------------o
    --    |
    --    | package_content_id = 'candy'
    --    |
    --    v
    --  -------  presentation = 'piece'
    -- | candy | package_size = 1 (Corresponds to 'individual')
    --  --+----  package_is_top = FALSE
    --    | package_content_id = NULL (Doesn't contain any more things)
    --    v
    --  NULL
    --
    -- When an app shows
    -- the variants of a product it should start by all variants defined as
    -- 'top' and descend from there
    package_is_top BOOLEAN NOT NULL DEFAULT TRUE,
    presentation_id INTEGER NOT NULL DEFAULT 1,
    -- This specifies if package is 'box', 'bag', 'individual' (default), etc.
    package_size INTEGER NOT NULL DEFAULT 1, -- Ignored if presentation 'individual'
                                             -- otherwise it specifies number of
                                             -- elements inside box/bag
    package_content_id INTEGER,
    -- product_variant contained in this variant if said variant is a package
    -- with several items
    -- NULL if presentation is individual (nothing else inside)

    color INTEGER NOT NULL DEFAULT 'no_color',
    -- Not restricted to a specific list of colors intended use includes
    -- 'no_color', specific colors like 'red' or even groups of colors like
    -- 'Pastel colors' or 'Fluorescent colors'
    -- Nevertheless, table 'color' can be used a
    -- suggested catalog

    tamano TEXT NOT NULL DEFAULT 'no_tamano',
    -- Size. Not necessarily linear, for example '10cm x 10cm', 20grams,
    -- 'no_tamano' intended for products with only one size

    price NUMERIC CHECK (price > 0), -- our selling price

    existence_id INTEGER NOT NULL DEFAULT 1,
    -- Default 1 means 'plenty' existence
    -- There's also 'scarce' and 'depleted'

    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (presentation_id) REFERENCES presentation(id),
    FOREIGN KEY (existence_id) REFERENCES existence(id),

    -- Tho I think there should be some sort of UNIQUE clause here that assures
    -- no repeated variants, I'm not so sure that's viable without including
    -- almost all the columns of the table and yet I'm not sure that should be
    -- disallowed
    UNIQUE (product_id, brand, presentation_id, package_size, package_content_id, color, tamano)
);

CREATE TRIGGER product_variant_prevent_duplicate_with_nulls
BEFORE INSERT ON product_variant
BEGIN
    -- An UNIQUE that doesn't consider NULL != NULL, so it prevents inserting
    -- two equal rows when package_content_id is NULL in two cases
    SELECT
        CASE
        WHEN EXISTS (
            SELECT 1 FROM product_variant
            WHERE product_id = NEW.product_id
              AND brand = NEW.brand
              AND presentation_id = NEW.presentation_id
              AND package_size = NEW.package_size
              AND (
                (package_content_id IS NULL AND NEW.package_content_id IS NULL)
                OR package_content_id = NEW.package_content_id
              )
              AND color = NEW.color
              AND tamano = NEW.tamano
        )
        THEN
            RAISE(ABORT, 'Duplicate product_variant not allowed (treating NULLs as equal)')
    END;
END;


-- TABLE --
-- Table that contains our buying price
-- Each product_variant can have several providers
CREATE TABLE provider_price (
    id INTEGER PRIMARY KEY,

    product_variant_id INTEGER NOT NULL,

    price NUMERIC CHECK (price > 0),
    provider TEXT NOT NULL DEFAULT 'unknown',

    FOREIGN KEY (product_variant_id) REFERENCES product_variant(id),
    UNIQUE (product_variant_id, provider)
);

-- VIEW --
CREATE VIEW v_product_variant AS
SELECT
    pv.id product_variant_id,
    p.id product_id,
    p.name,
    pv.brand,
    pv.presentation,
    pv.package_size,
    pv.color,
    pv.tamano,
    pv.price
FROM
    product p
JOIN
    product_variant pv
ON
    p.id = pv.product_id;
