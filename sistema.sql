PGDMP  1                    |            sistema_academico    17.0    17.0 %    L           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            M           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            N           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            O           1262    16501    sistema_academico    DATABASE     �   CREATE DATABASE sistema_academico WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
 !   DROP DATABASE sistema_academico;
                     postgres    false            �            1259    16502    aluno    TABLE     �  CREATE TABLE public.aluno (
    ra character varying(10) NOT NULL,
    nome character varying(100) NOT NULL,
    cpf character varying(11) NOT NULL,
    datanascimento date NOT NULL,
    sexo character varying(1),
    escolaridade character varying(50),
    email character varying(100) NOT NULL,
    CONSTRAINT aluno_sexo_check CHECK (((sexo)::text = ANY ((ARRAY['M'::character varying, 'F'::character varying])::text[])))
);
    DROP TABLE public.aluno;
       public         heap r       postgres    false            �            1259    16521    curso    TABLE     _  CREATE TABLE public.curso (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    valor numeric(10,2) NOT NULL,
    cargahoraria integer NOT NULL,
    status character varying(10) NOT NULL,
    CONSTRAINT curso_status_check CHECK (((status)::text = ANY ((ARRAY['ativo'::character varying, 'inativo'::character varying])::text[])))
);
    DROP TABLE public.curso;
       public         heap r       postgres    false            �            1259    16520    curso_id_seq    SEQUENCE     �   CREATE SEQUENCE public.curso_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.curso_id_seq;
       public               postgres    false    221            P           0    0    curso_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.curso_id_seq OWNED BY public.curso.id;
          public               postgres    false    220            �            1259    16535 	   matricula    TABLE     )  CREATE TABLE public.matricula (
    raaluno character varying(10) NOT NULL,
    idcurso integer NOT NULL,
    datamatricula date NOT NULL,
    n1 numeric(4,2),
    n2 numeric(4,2),
    nf numeric(4,2) GENERATED ALWAYS AS (((n1 + n2) / (2)::numeric)) STORED,
    resultado character varying(10)
);
    DROP TABLE public.matricula;
       public         heap r       postgres    false            �            1259    16529    periodo    TABLE     r   CREATE TABLE public.periodo (
    id integer NOT NULL,
    datainicio date NOT NULL,
    datafim date NOT NULL
);
    DROP TABLE public.periodo;
       public         heap r       postgres    false            �            1259    16528    periodo_id_seq    SEQUENCE     �   CREATE SEQUENCE public.periodo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.periodo_id_seq;
       public               postgres    false    223            Q           0    0    periodo_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.periodo_id_seq OWNED BY public.periodo.id;
          public               postgres    false    222            �            1259    16511 	   professor    TABLE     �  CREATE TABLE public.professor (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    cpf character varying(11) NOT NULL,
    datanascimento date NOT NULL,
    sexo character varying(1),
    titulacao character varying(50),
    email character varying(100) NOT NULL,
    CONSTRAINT professor_sexo_check CHECK (((sexo)::text = ANY ((ARRAY['M'::character varying, 'F'::character varying])::text[])))
);
    DROP TABLE public.professor;
       public         heap r       postgres    false            �            1259    16510    professor_id_seq    SEQUENCE     �   CREATE SEQUENCE public.professor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.professor_id_seq;
       public               postgres    false    219            R           0    0    professor_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.professor_id_seq OWNED BY public.professor.id;
          public               postgres    false    218            �           2604    16524    curso id    DEFAULT     d   ALTER TABLE ONLY public.curso ALTER COLUMN id SET DEFAULT nextval('public.curso_id_seq'::regclass);
 7   ALTER TABLE public.curso ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    220    221    221            �           2604    16532 
   periodo id    DEFAULT     h   ALTER TABLE ONLY public.periodo ALTER COLUMN id SET DEFAULT nextval('public.periodo_id_seq'::regclass);
 9   ALTER TABLE public.periodo ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    222    223    223            �           2604    16514    professor id    DEFAULT     l   ALTER TABLE ONLY public.professor ALTER COLUMN id SET DEFAULT nextval('public.professor_id_seq'::regclass);
 ;   ALTER TABLE public.professor ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    219    218    219            B          0    16502    aluno 
   TABLE DATA           Y   COPY public.aluno (ra, nome, cpf, datanascimento, sexo, escolaridade, email) FROM stdin;
    public               postgres    false    217   e+       F          0    16521    curso 
   TABLE DATA           F   COPY public.curso (id, nome, valor, cargahoraria, status) FROM stdin;
    public               postgres    false    221   �,       I          0    16535 	   matricula 
   TABLE DATA           W   COPY public.matricula (raaluno, idcurso, datamatricula, n1, n2, resultado) FROM stdin;
    public               postgres    false    224   �-       H          0    16529    periodo 
   TABLE DATA           :   COPY public.periodo (id, datainicio, datafim) FROM stdin;
    public               postgres    false    223   }.       D          0    16511 	   professor 
   TABLE DATA           Z   COPY public.professor (id, nome, cpf, datanascimento, sexo, titulacao, email) FROM stdin;
    public               postgres    false    219   �.       S           0    0    curso_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.curso_id_seq', 10, true);
          public               postgres    false    220            T           0    0    periodo_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.periodo_id_seq', 10, true);
          public               postgres    false    222            U           0    0    professor_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.professor_id_seq', 29, true);
          public               postgres    false    218            �           2606    16509    aluno aluno_cpf_key 
   CONSTRAINT     M   ALTER TABLE ONLY public.aluno
    ADD CONSTRAINT aluno_cpf_key UNIQUE (cpf);
 =   ALTER TABLE ONLY public.aluno DROP CONSTRAINT aluno_cpf_key;
       public                 postgres    false    217            �           2606    16507    aluno aluno_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.aluno
    ADD CONSTRAINT aluno_pkey PRIMARY KEY (ra);
 :   ALTER TABLE ONLY public.aluno DROP CONSTRAINT aluno_pkey;
       public                 postgres    false    217            �           2606    16527    curso curso_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.curso DROP CONSTRAINT curso_pkey;
       public                 postgres    false    221            �           2606    16540    matricula matricula_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.matricula
    ADD CONSTRAINT matricula_pkey PRIMARY KEY (raaluno, idcurso);
 B   ALTER TABLE ONLY public.matricula DROP CONSTRAINT matricula_pkey;
       public                 postgres    false    224    224            �           2606    16534    periodo periodo_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.periodo
    ADD CONSTRAINT periodo_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.periodo DROP CONSTRAINT periodo_pkey;
       public                 postgres    false    223            �           2606    16519    professor professor_cpf_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.professor
    ADD CONSTRAINT professor_cpf_key UNIQUE (cpf);
 E   ALTER TABLE ONLY public.professor DROP CONSTRAINT professor_cpf_key;
       public                 postgres    false    219            �           2606    16517    professor professor_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.professor
    ADD CONSTRAINT professor_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.professor DROP CONSTRAINT professor_pkey;
       public                 postgres    false    219            �           1259    16551    idx_cpf_aluno    INDEX     >   CREATE INDEX idx_cpf_aluno ON public.aluno USING btree (cpf);
 !   DROP INDEX public.idx_cpf_aluno;
       public                 postgres    false    217            �           1259    16552    idx_cpf_professor    INDEX     F   CREATE INDEX idx_cpf_professor ON public.professor USING btree (cpf);
 %   DROP INDEX public.idx_cpf_professor;
       public                 postgres    false    219            �           2606    16546     matricula matricula_idcurso_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.matricula
    ADD CONSTRAINT matricula_idcurso_fkey FOREIGN KEY (idcurso) REFERENCES public.curso(id);
 J   ALTER TABLE ONLY public.matricula DROP CONSTRAINT matricula_idcurso_fkey;
       public               postgres    false    4778    224    221            �           2606    16541     matricula matricula_raaluno_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.matricula
    ADD CONSTRAINT matricula_raaluno_fkey FOREIGN KEY (raaluno) REFERENCES public.aluno(ra);
 J   ALTER TABLE ONLY public.matricula DROP CONSTRAINT matricula_raaluno_fkey;
       public               postgres    false    4770    217    224            B   `  x�m�MN�0�����+��߁E�ZQ�-�!1�ʉ+�t����:܄�`�Q]Օ�r�>=͌`�3�aa~��(�G�"��j�.c��3X�}?�ސ���O�l�١ҳ�t�8PVh��?X]�E��8e5�9�/��g"+��l�������J����I��+�v>a,q�H���طr��eS��}q9�s���Zm��V*���s���
�mƝ��Xh�,`��F��� ���Pє�~'p�s�W�rlp �}k���ҏ��,�<�ǧ}*�*����4�A�<W��
O�u�Eb�b��d�:����mp�����ގ�K�]�b�
���;��ۭ3E\p{L�yϳ$I��b��      F   �   x�]бN�0���~�ʥqҎD*�C%�YN�	��\�8�L}��G1#o��`�������w[�����N��?�����s(9�ST����ޢ�����FP'Pe����R�"���=�DD&%<O~1ќ�E�H!b��b5��XcqTDR��*8�8�[P�i�T����C�n#;NZ#;�g��	���8^qx'��NP�<���(���8Ҳ�4Z8�}2�r8�4�	���Î��t��^7EQ��fq�      I   �   x�u�;� �z��Ѳ�|�\�u�HI�(E��F [D�Az�`bG����~!^�%[!$K����}����<� *���=|�N��ɓ��0�(���	�9�cx-���1.�`B�еqyҜ����4Ξ\P:��	�]�t�>1�����&W�      H   Z   x�E���0C�3٥(vC�]�Zp�[������Ѻ�|�'8��Q>�C�>�?�����?W�<�/Ez��+����U9p���^s�*$      D     x�e�;r�0���)xr ��Ŗc'+��)��$d�C�R�*U�.WIn��d� �0,����cwIa�����j��9P��EQ�UUe-II��9l�F��y����wb�r�:5�r��x�V�¡���m#����RҤ��-lļh|⑲��^�e�{!5ޟeU7-���۔ҔVx�՛�G�� %|��'�
X��UY�Ԧ��)�1L!��f���k���������t�0�*�ȡq�)"J�BO|�yr���*t���5f��,��WD��w�<�a����O���JXJ��08R����G?��EN3�"J��R���Y��D�^%GC6b걔cľK[��DK�<!�ٿ�E�s��Z�q4�T�lw�cw�w��9�W����u*��4X�{�c�l�S-���ǰ�����ˑñ�C�@��{lγ����I�E��i=��U��Ş)΍�DP�Z��Cr�F�;�J��'!.���ً	�A�r�a���Y��?��d���&ǎV���RӘ����\v��f��i�vX�^%�Zȅ�h�)����2_�"�:E���n��>���2��0�*-ș��V��V�
�8�g��Q���n�$�E왴��l�c.#��'������n�6%�K|S\e���Y�p_z�i8~�K�Y�>�uax|�OU�����hw+����1z�-�p�ܱ���`f�_�cޞ�08��P��&�Y��~-w�1��Rĵ�n`Gj����G�_E�\p����)[�V�Zm�     