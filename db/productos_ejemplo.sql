
-- PRODUCT --
INSERT INTO product (id, name) VALUES (1, 'Cubo');

INSERT INTO product_variant (
    id,
    product_id,
    price
) VALUES (
    1,
    1,
    20
);


-- PRODUCT --

INSERT INTO product (id, name) VALUES (2, 'Lapiz Adhesivo');

INSERT INTO product_variant (
    id,
    product_id,

    brand,
    tamano,
    price
) VALUES
    (2, 2, 'prit', '10g', 10),
    (3, 2, 'prit', '20g', 15),
    (4, 2, 'prit', '30g', 20),

    (5, 2, 'dixon', '10g', 10),
    (6, 2, 'dixon', '20g', 15),
    (7, 2, 'dixon', '30g', 20);


-- PRODUCT --
INSERT INTO product (id, name) VALUES (3, 'Clip');

INSERT INTO product_variant (
    id,
    product_id,

    presentation_id,
    package_size,
    price
) VALUES
    ( 8 , 3 , 4 , 100 , 10 ), -- 4=box
    ( 9 , 3 , 1 , 1   , .5 ); -- 1=individual

-- PRODUCT --
INSERT INTO product (id, name) VALUES (4, 'Mazapan');

INSERT INTO product_variant (
    id,
    product_id,

    brand,
    tamano,
    price
) VALUES
    (10 , 4 , 'De la Rosa', 'mediano', 4),
    (11 , 4 , 'De la Rosa', 'grande' , 7);

-- PRODUCT --
INSERT INTO product (id, name) VALUES (5, 'Cartulina');

INSERT INTO product_variant (
    id,
    product_id,

    brand,
    presentation_id,
    package_size,
    color,
    tamano,
    price
) VALUES
    (12, 5 , 'B1' , 4 , 10 , 'white'       , 'half'  , 50),
    (13, 5 , 'B1' , 4 , 10 , 'white'       , 'whole' , 50),
    (14, 5 , 'B1' , 4 , 10 , 'pastel'      , 'half'  , 60),
    (15, 5 , 'B1' , 4 , 10 , 'pastel'      , 'whole' , 60),
    (16, 5 , 'B1' , 4 , 10 , 'fluorescent' , 'half'  , 70),
    (17, 5 , 'B1' , 4 , 10 , 'fluorescent' , 'whole' , 70),
    (18, 5 , 'B1' , 4 , 10 , 'black'       , 'half'  , 80),
    (19, 5 , 'B1' , 4 , 10 , 'black'       , 'whole' , 80),
    (20, 5 , 'B1' , 1 ,  1 , 'white'       , 'half'  ,  5),
    (21, 5 , 'B1' , 1 ,  1 , 'white'       , 'whole' ,  5),
    (22, 5 , 'B1' , 1 ,  1 , 'pastel'      , 'half'  ,  6),
    (23, 5 , 'B1' , 1 ,  1 , 'pastel'      , 'whole' ,  6),
    (24, 5 , 'B1' , 1 ,  1 , 'fluorescent' , 'half'  ,  7),
    (25, 5 , 'B1' , 1 ,  1 , 'fluorescent' , 'whole' ,  7),
    (26, 5 , 'B1' , 1 ,  1 , 'black'       , 'half'  ,  8),
    (27, 5 , 'B1' , 1 ,  1 , 'black'       , 'whole' ,  8),

    (28, 5 , 'B2' , 4 , 10 , 'white'       , 'half'  , 50),
    (29, 5 , 'B2' , 4 , 10 , 'white'       , 'whole' , 50),
    (30, 5 , 'B2' , 4 , 10 , 'pastel'      , 'half'  , 60),
    (31, 5 , 'B2' , 4 , 10 , 'pastel'      , 'whole' , 60),
    (32, 5 , 'B2' , 4 , 10 , 'fluorescent' , 'half'  , 70),
    (33, 5 , 'B2' , 4 , 10 , 'fluorescent' , 'whole' , 70),
    (34, 5 , 'B2' , 4 , 10 , 'black'       , 'half'  , 80),
    (35, 5 , 'B2' , 4 , 10 , 'black'       , 'whole' , 80),
    (36, 5 , 'B2' , 1 ,  1 , 'white'       , 'half'  ,  5),
    (37, 5 , 'B2' , 1 ,  1 , 'white'       , 'whole' ,  5),
    (38, 5 , 'B2' , 1 ,  1 , 'pastel'      , 'half'  ,  6),
    (39, 5 , 'B2' , 1 ,  1 , 'pastel'      , 'whole' ,  6),
    (40, 5 , 'B2' , 1 ,  1 , 'fluorescent' , 'half'  ,  7),
    (41, 5 , 'B2' , 1 ,  1 , 'fluorescent' , 'whole' ,  7),
    (42, 5 , 'B2' , 1 ,  1 , 'black'       , 'half'  ,  8),
    (43, 5 , 'B2' , 1 ,  1 , 'black'       , 'whole' ,  8);
