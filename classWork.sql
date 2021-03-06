PGDMP              
            x           DataBaseProject    12.3    12.3 0    <           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            =           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            >           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    16421    DataBaseProject    DATABASE     �   CREATE DATABASE "DataBaseProject" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
 !   DROP DATABASE "DataBaseProject";
                me    false            @           0    0    DATABASE "DataBaseProject"    COMMENT     >   COMMENT ON DATABASE "DataBaseProject" IS 'School DB project';
                   me    false    2879            �            1259    16447 	   Customers    TABLE     �   CREATE TABLE public."Customers" (
    "companyName" character varying,
    "contactName" character varying,
    "contactEmail" character varying,
    "contactPhone" integer,
    "customerId" integer NOT NULL
);
    DROP TABLE public."Customers";
       public         heap    me    false            �            1259    16445    Customers_customerId_seq    SEQUENCE     �   CREATE SEQUENCE public."Customers_customerId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."Customers_customerId_seq";
       public          me    false    207            A           0    0    Customers_customerId_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public."Customers_customerId_seq" OWNED BY public."Customers"."customerId";
          public          me    false    206            �            1259    16430    Manufactures    TABLE     �   CREATE TABLE public."Manufactures" (
    "companyName" character varying(50),
    "contactName" character varying(50),
    "contactEmail" character varying(255),
    "contactPhone" integer,
    "manufactureId" integer NOT NULL
);
 "   DROP TABLE public."Manufactures";
       public         heap    me    false            �            1259    16428    Manufactures_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Manufactures_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."Manufactures_id_seq";
       public          me    false    204            B           0    0    Manufactures_id_seq    SEQUENCE OWNED BY     \   ALTER SEQUENCE public."Manufactures_id_seq" OWNED BY public."Manufactures"."manufactureId";
          public          me    false    203            �            1259    16422    Users    TABLE     �   CREATE TABLE public."Users" (
    "firstName" character varying,
    "lastName" character varying(50),
    "userId" integer NOT NULL,
    email character varying
);
    DROP TABLE public."Users";
       public         heap    me    false            �            1259    16436    Users_userId_seq    SEQUENCE     �   CREATE SEQUENCE public."Users_userId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."Users_userId_seq";
       public          me    false    202            C           0    0    Users_userId_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Users_userId_seq" OWNED BY public."Users"."userId";
          public          me    false    205            �            1259    16458    items    TABLE     o   CREATE TABLE public.items (
    name character varying,
    description text,
    "itemId" integer NOT NULL
);
    DROP TABLE public.items;
       public         heap    me    false            �            1259    16456    items_itemId_seq    SEQUENCE     �   CREATE SEQUENCE public."items_itemId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."items_itemId_seq";
       public          me    false    209            D           0    0    items_itemId_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public."items_itemId_seq" OWNED BY public.items."itemId";
          public          me    false    208            �            1259    16469    purchaseOrder    TABLE     �   CREATE TABLE public."purchaseOrder" (
    "itemId" integer,
    qty integer,
    "dateOrdered" date,
    "dateRecieved" date,
    "purchaseId" integer NOT NULL,
    "manufactureId" integer
);
 #   DROP TABLE public."purchaseOrder";
       public         heap    me    false            �            1259    16467    purchaseOrder_purchaseId_seq    SEQUENCE     �   CREATE SEQUENCE public."purchaseOrder_purchaseId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public."purchaseOrder_purchaseId_seq";
       public          me    false    211            E           0    0    purchaseOrder_purchaseId_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public."purchaseOrder_purchaseId_seq" OWNED BY public."purchaseOrder"."purchaseId";
          public          me    false    210            �            1259    16477 
   salesOrder    TABLE     �   CREATE TABLE public."salesOrder" (
    "salesID" integer NOT NULL,
    "customerId" integer,
    "itemId" integer,
    qty integer,
    "dateOrdered" date,
    "dateRecieved" date,
    "manufactureID" integer,
    "purchaseOrder" boolean
);
     DROP TABLE public."salesOrder";
       public         heap    me    false            F           0    0 #   COLUMN "salesOrder"."manufactureID"    COMMENT     k   COMMENT ON COLUMN public."salesOrder"."manufactureID" IS 'Indicates which MF will fill the order request';
          public          me    false    213            G           0    0 #   COLUMN "salesOrder"."purchaseOrder"    COMMENT     �   COMMENT ON COLUMN public."salesOrder"."purchaseOrder" IS 'This is a true-false with logic from JS to ensure all items have an associated Manufacture all set this flag';
          public          me    false    213            �            1259    16475    salesOrder_salesID_seq    SEQUENCE     �   CREATE SEQUENCE public."salesOrder_salesID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."salesOrder_salesID_seq";
       public          me    false    213            H           0    0    salesOrder_salesID_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public."salesOrder_salesID_seq" OWNED BY public."salesOrder"."salesID";
          public          me    false    212            �
           2604    16450    Customers customerId    DEFAULT     �   ALTER TABLE ONLY public."Customers" ALTER COLUMN "customerId" SET DEFAULT nextval('public."Customers_customerId_seq"'::regclass);
 G   ALTER TABLE public."Customers" ALTER COLUMN "customerId" DROP DEFAULT;
       public          me    false    206    207    207            �
           2604    16433    Manufactures manufactureId    DEFAULT     �   ALTER TABLE ONLY public."Manufactures" ALTER COLUMN "manufactureId" SET DEFAULT nextval('public."Manufactures_id_seq"'::regclass);
 M   ALTER TABLE public."Manufactures" ALTER COLUMN "manufactureId" DROP DEFAULT;
       public          me    false    204    203    204            �
           2604    16438    Users userId    DEFAULT     r   ALTER TABLE ONLY public."Users" ALTER COLUMN "userId" SET DEFAULT nextval('public."Users_userId_seq"'::regclass);
 ?   ALTER TABLE public."Users" ALTER COLUMN "userId" DROP DEFAULT;
       public          me    false    205    202            �
           2604    16461    items itemId    DEFAULT     p   ALTER TABLE ONLY public.items ALTER COLUMN "itemId" SET DEFAULT nextval('public."items_itemId_seq"'::regclass);
 =   ALTER TABLE public.items ALTER COLUMN "itemId" DROP DEFAULT;
       public          me    false    209    208    209            �
           2604    16472    purchaseOrder purchaseId    DEFAULT     �   ALTER TABLE ONLY public."purchaseOrder" ALTER COLUMN "purchaseId" SET DEFAULT nextval('public."purchaseOrder_purchaseId_seq"'::regclass);
 K   ALTER TABLE public."purchaseOrder" ALTER COLUMN "purchaseId" DROP DEFAULT;
       public          me    false    211    210    211            �
           2604    16480    salesOrder salesID    DEFAULT     ~   ALTER TABLE ONLY public."salesOrder" ALTER COLUMN "salesID" SET DEFAULT nextval('public."salesOrder_salesID_seq"'::regclass);
 E   ALTER TABLE public."salesOrder" ALTER COLUMN "salesID" DROP DEFAULT;
       public          me    false    212    213    213            3          0    16447 	   Customers 
   TABLE DATA           q   COPY public."Customers" ("companyName", "contactName", "contactEmail", "contactPhone", "customerId") FROM stdin;
    public          me    false    207   x5       0          0    16430    Manufactures 
   TABLE DATA           w   COPY public."Manufactures" ("companyName", "contactName", "contactEmail", "contactPhone", "manufactureId") FROM stdin;
    public          me    false    204   �5       .          0    16422    Users 
   TABLE DATA           K   COPY public."Users" ("firstName", "lastName", "userId", email) FROM stdin;
    public          me    false    202   46       5          0    16458    items 
   TABLE DATA           <   COPY public.items (name, description, "itemId") FROM stdin;
    public          me    false    209   �6       7          0    16469    purchaseOrder 
   TABLE DATA           v   COPY public."purchaseOrder" ("itemId", qty, "dateOrdered", "dateRecieved", "purchaseId", "manufactureId") FROM stdin;
    public          me    false    211   U7       9          0    16477 
   salesOrder 
   TABLE DATA           �   COPY public."salesOrder" ("salesID", "customerId", "itemId", qty, "dateOrdered", "dateRecieved", "manufactureID", "purchaseOrder") FROM stdin;
    public          me    false    213   r7       I           0    0    Customers_customerId_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."Customers_customerId_seq"', 1, false);
          public          me    false    206            J           0    0    Manufactures_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Manufactures_id_seq"', 5, true);
          public          me    false    203            K           0    0    Users_userId_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Users_userId_seq"', 9, true);
          public          me    false    205            L           0    0    items_itemId_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."items_itemId_seq"', 8, true);
          public          me    false    208            M           0    0    purchaseOrder_purchaseId_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public."purchaseOrder_purchaseId_seq"', 1, false);
          public          me    false    210            N           0    0    salesOrder_salesID_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."salesOrder_salesID_seq"', 1, false);
          public          me    false    212            �
           2606    16455    Customers Customers_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."Customers"
    ADD CONSTRAINT "Customers_pkey" PRIMARY KEY ("customerId");
 F   ALTER TABLE ONLY public."Customers" DROP CONSTRAINT "Customers_pkey";
       public            me    false    207            �
           2606    16435    Manufactures Manufactures_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public."Manufactures"
    ADD CONSTRAINT "Manufactures_pkey" PRIMARY KEY ("manufactureId");
 L   ALTER TABLE ONLY public."Manufactures" DROP CONSTRAINT "Manufactures_pkey";
       public            me    false    204            �
           2606    16466    items items_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY ("itemId");
 :   ALTER TABLE ONLY public.items DROP CONSTRAINT items_pkey;
       public            me    false    209            �
           2606    16474     purchaseOrder purchaseOrder_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public."purchaseOrder"
    ADD CONSTRAINT "purchaseOrder_pkey" PRIMARY KEY ("purchaseId");
 N   ALTER TABLE ONLY public."purchaseOrder" DROP CONSTRAINT "purchaseOrder_pkey";
       public            me    false    211            �
           2606    16482    salesOrder salesOrder_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public."salesOrder"
    ADD CONSTRAINT "salesOrder_pkey" PRIMARY KEY ("salesID");
 H   ALTER TABLE ONLY public."salesOrder" DROP CONSTRAINT "salesOrder_pkey";
       public            me    false    213            3      x������ � �      0   �   x�-ͻ
�@F���w���ZF�F66�fٝd�f,|{�Z�΍C�Qqd5ު����Y�,/�R��Y���A��ϹDFW��x�n�All<���bK�t6�����PO�K�P����P�֋钽�d�������Q�}ADFd3�      .   l   x�-̹
�0D�z��X��)X	���|�H0)�����S����$2�����	�3�Q`_���i�?+K#��>0$*�~<���5|�N����n�_*&      5   �   x�U�;�0D��S�	��S�h�"�2�:q����])9=AA5��y��P9�pv�;XL0�KkE��I��U��B�G��N�j�~Xb���Q鍙b���c*l��5^�j��Y:Ƥ��"q�''����ο����a�)
e;,g���y:�      7      x������ � �      9      x������ � �     