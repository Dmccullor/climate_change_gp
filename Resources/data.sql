PGDMP     ;                
    y            group_project    11.12    11.12                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                       1262    18811    group_project    DATABASE     �   CREATE DATABASE group_project WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE group_project;
             postgres    false            �            1259    18848    seadata    TABLE     t   CREATE TABLE public.seadata (
    year integer,
    north_extent double precision,
    gmsl_gia double precision
);
    DROP TABLE public.seadata;
       public         postgres    false                      0    18848    seadata 
   TABLE DATA               ?   COPY public.seadata (year, north_extent, gmsl_gia) FROM stdin;
    public       postgres    false    200   .          �  x�U�k��0��{i��c/w��8��hd		>��g��u1�%r�6g�{�m+ͻ\_�m�e�r�ps`�^�r��>����������B���:�.���r�� �;�8�e�Ρ#2X�+�X0oo��VV\��~4C{�;%����O�fOW\}d����"ڱY�jec\��%�qU��|z�-����M@�fs��|hZ�~��`ܹ	��^QC'u�?b���!C��2;�mh125�ig���N����p�vS�w iiK��h��c��dokX�mM��W��90�=""�|��#P*��Q�YH��;N�r��c�9^V�����>�6sf:���b����ɍ��Gq�]�� ��#�3	��R m�al��6��O��>"t�j�p�2hw�EbK?S�c�Q��o��"�z�8�1���Μ��,	=��1�e�	e8Y-�-���i�c��`��)b��������V,�L��!��>�Ph0�"[>���7����z�����     