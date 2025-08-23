
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
    package_is_top,
    price
) VALUES
    ( 8 , 3 , 4 , 100 , TRUE  , 10.00 ), -- 4=box
    ( 9 , 3 , 1 , 1   , FALSE ,  0.50 ); -- 1=piece

UPDATE product_variant SET package_content_id = 9 WHERE id = 8;

-- PRODUCT --
INSERT INTO product (id, name) VALUES (4, 'Mazapan');

INSERT INTO product_variant (
    id,
    product_id,

    brand,
    tamano,
    price
) VALUES
    (10 , 4 , 'De la Rosa', 'mediano', 4.00),
    (11 , 4 , 'De la Rosa', 'grande' , 7.00);

-- PRODUCT --
INSERT INTO product (id, name) VALUES (5, 'Cartulina');

INSERT INTO product_variant (
    id,
    product_id,

    brand,
    presentation_id,
    package_size,
    package_is_top,
    color,
    tamano,
    price
) VALUES
    (12, 5 , 'B1' , 5 , 10 ,  TRUE , 'white'       , 'half'  , 50.00),
    (13, 5 , 'B1' , 5 , 10 ,  TRUE , 'white'       , 'whole' , 50.00),
    (14, 5 , 'B1' , 5 , 10 ,  TRUE , 'pastel'      , 'half'  , 60.00),
    (15, 5 , 'B1' , 5 , 10 ,  TRUE , 'pastel'      , 'whole' , 60.00),
    (16, 5 , 'B1' , 5 , 10 ,  TRUE , 'fluorescent' , 'half'  , 70.00),
    (17, 5 , 'B1' , 5 , 10 ,  TRUE , 'fluorescent' , 'whole' , 70.00),
    (18, 5 , 'B1' , 5 , 10 ,  TRUE , 'black'       , 'half'  , 80.00),
    (19, 5 , 'B1' , 5 , 10 ,  TRUE , 'black'       , 'whole' , 80.00),
    (20, 5 , 'B1' , 3 ,  1 , FALSE , 'white'       , 'half'  ,  5.00),
    (21, 5 , 'B1' , 3 ,  1 , FALSE , 'white'       , 'whole' ,  5.00),
    (22, 5 , 'B1' , 3 ,  1 , FALSE , 'pastel'      , 'half'  ,  6.00),
    (23, 5 , 'B1' , 3 ,  1 , FALSE , 'pastel'      , 'whole' ,  6.00),
    (24, 5 , 'B1' , 3 ,  1 , FALSE , 'fluorescent' , 'half'  ,  7.00),
    (25, 5 , 'B1' , 3 ,  1 , FALSE , 'fluorescent' , 'whole' ,  7.00),
    (26, 5 , 'B1' , 3 ,  1 , FALSE , 'black'       , 'half'  ,  8.00),
    (27, 5 , 'B1' , 3 ,  1 , FALSE , 'black'       , 'whole' ,  8.00),

    (28, 5 , 'B2' , 5 , 10 ,  TRUE , 'white'       , 'half'  , 50.00),
    (29, 5 , 'B2' , 5 , 10 ,  TRUE , 'white'       , 'whole' , 50.00),
    (30, 5 , 'B2' , 5 , 10 ,  TRUE , 'pastel'      , 'half'  , 60.00),
    (31, 5 , 'B2' , 5 , 10 ,  TRUE , 'pastel'      , 'whole' , 60.00),
    (32, 5 , 'B2' , 5 , 10 ,  TRUE , 'fluorescent' , 'half'  , 70.00),
    (33, 5 , 'B2' , 5 , 10 ,  TRUE , 'fluorescent' , 'whole' , 70.00),
    (34, 5 , 'B2' , 5 , 10 ,  TRUE , 'black'       , 'half'  , 80.00),
    (35, 5 , 'B2' , 5 , 10 ,  TRUE , 'black'       , 'whole' , 80.00),
    (36, 5 , 'B2' , 3 ,  1 , FALSE , 'white'       , 'half'  ,  5.00),
    (37, 5 , 'B2' , 3 ,  1 , FALSE , 'white'       , 'whole' ,  5.00),
    (38, 5 , 'B2' , 3 ,  1 , FALSE , 'pastel'      , 'half'  ,  6.00),
    (39, 5 , 'B2' , 3 ,  1 , FALSE , 'pastel'      , 'whole' ,  6.00),
    (40, 5 , 'B2' , 3 ,  1 , FALSE , 'fluorescent' , 'half'  ,  7.00),
    (41, 5 , 'B2' , 3 ,  1 , FALSE , 'fluorescent' , 'whole' ,  7.00),
    (42, 5 , 'B2' , 3 ,  1 , FALSE , 'black'       , 'half'  ,  8.00),
    (43, 5 , 'B2' , 3 ,  1 , FALSE , 'black'       , 'whole' ,  8.00);

UPDATE product_variant SET package_content_id = 20 WHERE id = 12;
UPDATE product_variant SET package_content_id = 21 WHERE id = 13;
UPDATE product_variant SET package_content_id = 22 WHERE id = 14;
UPDATE product_variant SET package_content_id = 23 WHERE id = 15;
UPDATE product_variant SET package_content_id = 24 WHERE id = 16;
UPDATE product_variant SET package_content_id = 25 WHERE id = 17;
UPDATE product_variant SET package_content_id = 26 WHERE id = 18;
UPDATE product_variant SET package_content_id = 27 WHERE id = 19;

UPDATE product_variant SET package_content_id = 36 WHERE id = 28;
UPDATE product_variant SET package_content_id = 37 WHERE id = 29;
UPDATE product_variant SET package_content_id = 38 WHERE id = 30;
UPDATE product_variant SET package_content_id = 39 WHERE id = 31;
UPDATE product_variant SET package_content_id = 40 WHERE id = 32;
UPDATE product_variant SET package_content_id = 41 WHERE id = 33;
UPDATE product_variant SET package_content_id = 42 WHERE id = 34;
UPDATE product_variant SET package_content_id = 43 WHERE id = 35;
