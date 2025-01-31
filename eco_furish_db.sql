PGDMP     !    *    
            |         	   EcoFurish    14.5    14.5                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    40961 	   EcoFurish    DATABASE     p   CREATE DATABASE "EcoFurish" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United Kingdom.1252';
    DROP DATABASE "EcoFurish";
                postgres    false            �            1259    40983    dimcustomer    TABLE     �   CREATE TABLE public.dimcustomer (
    customerid integer NOT NULL,
    firstname character varying(50),
    lastname character varying(50),
    email character varying(100),
    city character varying(50),
    signupdate date,
    signupyear integer
);
    DROP TABLE public.dimcustomer;
       public         heap    postgres    false            �            1259    40982    dimcustomer_customerid_seq    SEQUENCE     �   CREATE SEQUENCE public.dimcustomer_customerid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.dimcustomer_customerid_seq;
       public          postgres    false    212                       0    0    dimcustomer_customerid_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.dimcustomer_customerid_seq OWNED BY public.dimcustomer.customerid;
          public          postgres    false    211            �            1259    40976 
   dimproduct    TABLE     �   CREATE TABLE public.dimproduct (
    productid integer NOT NULL,
    productname character varying(255),
    category character varying(50),
    price numeric(10,2),
    stockquantity integer,
    supplierid integer
);
    DROP TABLE public.dimproduct;
       public         heap    postgres    false            �            1259    40975    dimproduct_productid_seq    SEQUENCE     �   CREATE SEQUENCE public.dimproduct_productid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.dimproduct_productid_seq;
       public          postgres    false    210            	           0    0    dimproduct_productid_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.dimproduct_productid_seq OWNED BY public.dimproduct.productid;
          public          postgres    false    209            �            1259    40990 	   factsales    TABLE     �   CREATE TABLE public.factsales (
    saleid integer NOT NULL,
    productid integer,
    customerid integer,
    saledate date,
    quantitysold integer,
    saleamount numeric(10,2),
    saleyear integer
);
    DROP TABLE public.factsales;
       public         heap    postgres    false            �            1259    40989    factsales_saleid_seq    SEQUENCE     �   CREATE SEQUENCE public.factsales_saleid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.factsales_saleid_seq;
       public          postgres    false    214            
           0    0    factsales_saleid_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.factsales_saleid_seq OWNED BY public.factsales.saleid;
          public          postgres    false    213            g           2604    40986    dimcustomer customerid    DEFAULT     �   ALTER TABLE ONLY public.dimcustomer ALTER COLUMN customerid SET DEFAULT nextval('public.dimcustomer_customerid_seq'::regclass);
 E   ALTER TABLE public.dimcustomer ALTER COLUMN customerid DROP DEFAULT;
       public          postgres    false    211    212    212            f           2604    40979    dimproduct productid    DEFAULT     |   ALTER TABLE ONLY public.dimproduct ALTER COLUMN productid SET DEFAULT nextval('public.dimproduct_productid_seq'::regclass);
 C   ALTER TABLE public.dimproduct ALTER COLUMN productid DROP DEFAULT;
       public          postgres    false    209    210    210            h           2604    40993    factsales saleid    DEFAULT     t   ALTER TABLE ONLY public.factsales ALTER COLUMN saleid SET DEFAULT nextval('public.factsales_saleid_seq'::regclass);
 ?   ALTER TABLE public.factsales ALTER COLUMN saleid DROP DEFAULT;
       public          postgres    false    213    214    214            �          0    40983    dimcustomer 
   TABLE DATA           k   COPY public.dimcustomer (customerid, firstname, lastname, email, city, signupdate, signupyear) FROM stdin;
    public          postgres    false    212   o       �          0    40976 
   dimproduct 
   TABLE DATA           h   COPY public.dimproduct (productid, productname, category, price, stockquantity, supplierid) FROM stdin;
    public          postgres    false    210   "                 0    40990 	   factsales 
   TABLE DATA           p   COPY public.factsales (saleid, productid, customerid, saledate, quantitysold, saleamount, saleyear) FROM stdin;
    public          postgres    false    214   �#                  0    0    dimcustomer_customerid_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.dimcustomer_customerid_seq', 1, false);
          public          postgres    false    211                       0    0    dimproduct_productid_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.dimproduct_productid_seq', 1, false);
          public          postgres    false    209                       0    0    factsales_saleid_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.factsales_saleid_seq', 1, false);
          public          postgres    false    213            l           2606    40988    dimcustomer dimcustomer_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.dimcustomer
    ADD CONSTRAINT dimcustomer_pkey PRIMARY KEY (customerid);
 F   ALTER TABLE ONLY public.dimcustomer DROP CONSTRAINT dimcustomer_pkey;
       public            postgres    false    212            j           2606    40981    dimproduct dimproduct_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.dimproduct
    ADD CONSTRAINT dimproduct_pkey PRIMARY KEY (productid);
 D   ALTER TABLE ONLY public.dimproduct DROP CONSTRAINT dimproduct_pkey;
       public            postgres    false    210            n           2606    40995    factsales factsales_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.factsales
    ADD CONSTRAINT factsales_pkey PRIMARY KEY (saleid);
 B   ALTER TABLE ONLY public.factsales DROP CONSTRAINT factsales_pkey;
       public            postgres    false    214            p           2606    41001 #   factsales factsales_customerid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.factsales
    ADD CONSTRAINT factsales_customerid_fkey FOREIGN KEY (customerid) REFERENCES public.dimcustomer(customerid);
 M   ALTER TABLE ONLY public.factsales DROP CONSTRAINT factsales_customerid_fkey;
       public          postgres    false    214    3180    212            o           2606    40996 "   factsales factsales_productid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.factsales
    ADD CONSTRAINT factsales_productid_fkey FOREIGN KEY (productid) REFERENCES public.dimproduct(productid);
 L   ALTER TABLE ONLY public.factsales DROP CONSTRAINT factsales_productid_fkey;
       public          postgres    false    214    210    3178            �      x����n�0��y�٥~n-
=A�z1!	[E��y�Z���>(�%e�����v8�7��;ԟ�o�q|�O�����e�}����O�xz~�!�����{P<5��/O���i�IC�l�Q�Q���AL۠]b�b�c��X3/h���=&ט�����7�O���x��%���֣��~�����%����c��mb�ǿ7?��_%G�q���{N_s�Mηi��TN��3x�Pc�`9"M�%G+L�0���4R�p�&�|�%j]�R-�Z��U�_��lq�ٞ1�(�-�[����8�\?��	'.9X���(.$\�����K+b.�\B�C*,]���u	����څ��{�!�*H��A���y�Z�w�w�wD3���<�i�s|>�29��A��ޡAS#�;�;�;�;,����9ܬ�n ����G4�i��;�;�;B�s`� �p��euuЀ���ýc���kKٻ�wu�tu�*{W��]%ڬ\�P�xu����Z�P7/~���E�b�b�J����Ų�$U���]ݻ�h*;xe�J���kN�T��2x%��ൻ��ҕ�W2�n^��?�;M�zu�:�K�|�zg�7�o�ҕ/��f����7�o>#�+�ؾ�}s��++��������7���k���Oxz�Ǐ�z���w��=��5��Q�k`��}[O��`T�*ص*H�h�U0��y,��՗�q��`^����.��܃L=�ރ����V���~��&_�      �   8  x�mR�j1<�_�/+Y��k	=Rz�-���fa���+Ab����F��	���o;��v;-�
T	Y�H��3��O�|���:�;�a?_��(U�bNK��AS�-;����NjXZ��J��c�ՌS�,N[���g�g6�T;_�m����Gh��-l]Ӻ�qA!0u�FC�PL)JA4�)���QS�Q�û���1��w�h���r�����^�۶���!���h�ᓔ��6�	8�h�������g�ѱ�'����p�M��+�0s�h����L%2q�����6����y��`�V@#�'��~�}��         �  x�]Wm�$*�mߥ� �����[�`��l2�n�(
�
��7�_j��"�*�?�0~�k��N����:�X࿣�q,�~<�]i��1��ޕͫv>ߏ��{��pI]+��J���-x���B��gf����A�o�euR��/R!�7�g�י&>(�4�$<i���@&(d�Q�-��r�[��ʖ�h�=,��&��qJi"uG�nN�򘬃���ݯ��񢬓i�(�]���v�M�u�*r-f�T8�e�^��:��W,�#��Eh��9}��Q��J�ZlcFTB7�F�ĸUxd[�;�[�}����uv�BǪ7��-%9�G �k�k�ظ��|kE0*�lV
 EAfL��4�RzY{W���Y�pK�<�M��m=+��$��a����?H,� E[�%�������u�vc�H�lOr��BSn��9J��	%�t� �F������#��ik���#�Ս�ɮ��b����H(��m��z�F��s5���uDjid�ӆ�ΰ0XB��640n���n��)-SOi�=<]ˌ:7Mq~�<�]	�;�)�`��0�=|��S)��lLFk	p�O$�GB{���F3�p8'��`�ґ===Z�t�W�7��ȟ$q@�?=eˉ�P�c㓿Ì0��u��v�2��+6�}�̲����Å�SG�ayb�:n��4� [p�w��>�'�1ܚ�7��<+��6#� J>e��b`[D)��2[�&� ����:�`"��4��0ٶ�9���u�'<�A��k��<�g��h���蝂ٽ�O��(�A����u�	ʈ�o_�9��ot�H�'64�Y�z�	�7�f�6����LX�xN�,e4i�1���)���^���f$o�kƔ����59-M�L|����#*�p�\����C�ꥧZз��Yz���Bs�&��M~WF��N���	�\�.*�,�u�Di����h����>�\�W/��nGC���A�q�X����E3�1�\aA���u��0$c^�LJ$ѭF�%���O�x�����s3٫��������3��{���e���h�ᄐW���'�B>�Ek-���g��J�Sh9YW�mc�'��Y�f��z9����#���y���9�e/��S�%Ԏ���=�v85;��B��;z8�(�Y�Ւ�Q��_�=�>3�z>�{�;۟m�d��i!,�I�G���~��8�'J^�6ꡭu���;�������$R     