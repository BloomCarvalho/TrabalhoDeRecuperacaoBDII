CREATE DATABASE IF NOT EXISTS ligadajustica;
USE ligadajustica;

/*tabela das habilidades*/

CREATE TABLE IF NOT EXISTS habilidades(
nome_hab VARCHAR(35),
cod_hab INT PRIMARY KEY AUTO_INCREMENT);
 
 
/*tabela de vulnerabilidades*/

CREATE TABLE IF NOT EXISTS vulnerabilidades(
nome_vulnera VARCHAR(35),
cod_vulnera INT PRIMARY KEY AUTO_INCREMENT);
 
/*tabela de equipamentos*/

CREATE TABLE IF NOT EXISTS equipamentos(
nome_equip VARCHAR(35),
desc_equipamento TEXT,
cod_equip INT PRIMARY KEY AUTO_INCREMENT);

/*tabela das especies*/

CREATE TABLE IF NOT EXISTS especies(
nome_esp VARCHAR(20),
cod_esp INT AUTO_INCREMENT NOT NULL,
PRIMARY KEY(cod_esp)
);

/*tabela de esconderijos*/

CREATE TABLE IF NOT EXISTS esconderijos(
nome_escond VARCHAR(40),
cod_escond INT PRIMARY KEY AUTO_INCREMENT
);

/*tabela onde ficarão os vilões*/

CREATE TABLE IF NOT EXISTS viloes(
nome_vil VARCHAR(30),
codinome_vil VARCHAR(35),
cod_vil INT PRIMARY KEY AUTO_INCREMENT,
cod_esp INT,
cod_escond int,
foreign key(cod_escond) REFERENCES esconderijos(cod_escond),
FOREIGN KEY(cod_esp) REFERENCES especies(cod_esp)
);
 
/*tabelas onde ficarão os heróis*/

CREATE TABLE IF NOT EXISTS herois(
nome_her VARCHAR(40),
nivel_acesso INT1,
codinome_her VARCHAR(35),
cod_her INT PRIMARY KEY AUTO_INCREMENT,
cod_vil INT,
cod_esp INT,
FOREIGN KEY(cod_vil) REFERENCES viloes(cod_vil),
FOREIGN KEY(cod_esp) REFERENCES especies(cod_esp));
 
/*tabela de ataques*/

CREATE TABLE IF NOT EXISTS ataques(
data_ataq VARCHAR(11),
cod_ataque INT PRIMARY KEY AUTO_INCREMENT,
cod_escond INT,
cod_vil INT,
cod_her INT,
FOREIGN KEY(cod_escond) REFERENCES esconderijos(cod_escond),
FOREIGN KEY(cod_vil) REFERENCES viloes(cod_vil),
FOREIGN KEY(cod_her) REFERENCES herois(cod_her));

/*tabela associativa de heróis com equipamentos*/

CREATE TABLE IF NOT EXISTS ass_her_equip(
cod_equip INT,
cod_her INT,
FOREIGN KEY(cod_equip) REFERENCES equipamentos(cod_equip),
FOREIGN KEY(cod_her) REFERENCES herois(cod_her));

 /*tabela associativa vilões e equipamentos*/
 
  CREATE TABLE IF NOT EXISTS ass_vil_equip(
 cod_vil INT,
 cod_equip INT,
 FOREIGN KEY(cod_vil) REFERENCES viloes(cod_vil),
 FOREIGN KEY(cod_equip) REFERENCES equipamentos(cod_equip)
 );

/*tabela associativa vilões e habilidades*/
 
 CREATE TABLE IF NOT EXISTS ass_vil_hab(
 cod_vil INT,
 cod_hab INT,
 FOREIGN KEY(cod_vil) REFERENCES viloes(cod_vil),
 FOREIGN KEY(cod_hab) REFERENCES habilidades(cod_hab)
 );
 
 /*tabela associativa de herói com habilidade*/

CREATE TABLE IF NOT EXISTS ass_her_hab(
cod_her INT,
cod_hab INT,
FOREIGN KEY(cod_hab) REFERENCES habilidades(cod_hab),
FOREIGN KEY(cod_her) REFERENCES herois(cod_her));

/*tabela associativa de herois com vulnerabilidades*/

CREATE TABLE IF NOT EXISTS ass_her_vulnera(
cod_her INT,
cod_vulnera INT,
FOREIGN KEY(cod_her) REFERENCES herois(cod_her),
FOREIGN KEY(cod_vulnera) REFERENCES vulnerabilidades(cod_vulnera)
);

/*tabela associativa de viloes com vulnerabilidades*/

CREATE TABLE IF NOT EXISTS ass_vil_vulnera(
cod_vil INT,
cod_vulnera INT,
FOREIGN KEY(cod_vil) REFERENCES viloes(cod_vil),
FOREIGN KEY(cod_vulnera) REFERENCES vulnerabilidades(cod_vulnera)
);


insert into habilidades values ("VOO",1);
insert into habilidades values ("SUPER VELOCIDADE",2);
insert into habilidades values ("INTELIGÊNCIA",3);
insert into habilidades values ("SUPER FORÇA",4);
insert into habilidades values ("INVISIBILIDADE",5);
insert into habilidades values ("REGENERAÇÃO",6);
insert into habilidades values ("CRIAÇÃO POR LANTERNA",7);
insert into habilidades values ("DILATAÇÃO TEMPORAL",8);
insert into habilidades values ("INTANGIBILIDADE",9);
insert into habilidades values ("TELECINESE",10);
insert into habilidades values ("TELEPATIA",11);
insert into habilidades values ("SUPERVISÃO",12);
insert into habilidades values ("TRANSFIGURAÇÃO",13);
insert into habilidades values ("MANIPULAÇÃO DE DENSIDADE",14);
insert into habilidades values ("SUPER RESISTÊNCIA",15);
insert into habilidades values ("MAGIA",16);
insert into habilidades values ("NECROMANCIA",17);
insert into habilidades values ("CONTROLE ELEMENTAL",18);
insert into habilidades values ("ARTES MARCIAIS",19);
insert into habilidades values ("DINHEIRO",20);
insert into habilidades values ("IMPUREZA AMARELA",21);
insert into habilidades values ("ACELERAÇÃO NEGATIVA",22);
insert into habilidades values ("VENENO",23);
INSERT INTO habilidades values ("SUPER SOPRO",24);
INSERT INTO habilidades values ("SUPER AUDIÇÃO",25);
INSERT INTO habilidades values ("FOGO",26);
INSERT INTO habilidades values ("ÁGUA",28);
insert into habilidades values ("TELEPORTE",29);
INSERT INTO habilidades values ("IMORTALIDADE", 30);


INSERT INTO vulnerabilidades values ("IMPUREZA AMARELA",1);
INSERT INTO vulnerabilidades values ("HIPER ACELERAÇÃO",2);
INSERT INTO vulnerabilidades values ("ACELERAÇÃO NEGATIVA",3);
INSERT INTO vulnerabilidades values ("FOGO",4);
INSERT INTO vulnerabilidades values ("MUITO TEMPO FORA D'ÁGUA",5);
INSERT INTO vulnerabilidades values ("ÁGUA",6);
INSERT INTO vulnerabilidades values ("TELEPATIA",7);
INSERT INTO vulnerabilidades values ("VENENO",8);
INSERT INTO vulnerabilidades values ("MAGIA",9);
INSERT INTO vulnerabilidades values ("KRIPTONITA",10);
INSERT INTO vulnerabilidades values ("SUAS PRÓPRIAS ARMAS",11);
INSERT INTO vulnerabilidades values ("ARMAS PONTIAGUDAS",12);


INSERT INTO equipamentos values ("ANEL DOS LANTERNA VERDE", "O anel pode ser usado para disparar explosões de energia de Oana ou criar armas como os projéteis deles. O anel pode projetar feixes de força poderosos pela vontade do usuário",1);
INSERT INTO equipamentos values ("TRAJE GOD FLASH", "Traje construído para aprimorar as habilidades do flash e mante-lo vivo, possui aerodinâmica adequada, desfribiladores entre outras finalidades", 2);
INSERT INTO equipamentos values ("TRIDENTE DE NETUNO", "poder de comando do mar (fazendo ondas de maré ou redemoinhos ou mesmo fazendo colunas de água para se manter), controle o tempo (convocando chuva ou tempestades ou criando arco-íris), desencadeiam explosões de relâmpago, transformar criaturas vivas em outras formas, e também pode fazer desaparecer as coisas.", 3);
INSERT INTO equipamentos values ("TRAJE ZOOM", "Com as mesmas funções do traje GOD FLASH porêm com o sentido de aceleração reversa", 4);
INSERT INTO equipamentos values ("CINTO DE UTILIDADES", "Cinto com todas as funções possiveis (inclusive algumas impossíveis) para combater o crime", 5);
INSERT INTO equipamentos values ("BATARANGUES", "Batarangues são lâminas dobráveis e fixas capazes de desarmar oponentes, oponentes impressionantes, cabos que enredam os criminosos", 6);
INSERT INTO equipamentos values ("GRAPPLING GUN", "O dispositivo mais usado do Batman, dispara um cabo que permite ao Batman subir, descer, parar uma queda e balançar através do horizonte de Gotham sem a necessidade de transporte ruidos", 7);
INSERT INTO equipamentos values ("BATMÓVEL", "Um carro ultra modíficado e com diversas funcinalidades incríveis para combater o crime com rapidez e eficiência", 8);
INSERT INTO equipamentos values ("TIARA REAL AMAZONA", "A Tiara Real é uma arma afiada, pois pode ser usada como bumerangue com considerável poder cortante. Possui ainda propriedades mágicas, além de poder oferecer proteção mental/psiquica", 9);
INSERT INTO equipamentos values ("LAÇO DA VERDADE", "O Laço da Verdade é capaz de se estender infinitamente, permitindo à Mulher-Maravilha combater a longos alcances. Ao capturar um alvo, o item em questão exerce uma força absurda, suficiente para deter seres extremamente poderosos. Caso seja a intenção do usuário, ele pode prender ou manter detido seres de grande poder por quanto tempo desejar. Se por exemplo, um alvo capaz de se tornar intangível é preso pelo Laço da Verdade, ele será incapaz de usar sua habilidade para escapar caso aquele que o enlaçou deseje mantê-lo preso além das habilidades do laço permitem ao usuário extrair a verdade de quem estiver envolvido, sendo esse seu poder mais conhecido. Evidências provam que tentar resistir ao poder mágico de extrair a verdade é doloroso e ineficaz, visto que até mesmo deuses e entidades poderosas não escapam do poder da verdade.", 10);
INSERT INTO equipamentos values ("BRACELETES DA VITÓRIA", "Os Braceletes da Vitória/ Braceletes Indestrutíveis são úteis para defesa, como desviar projeteis (mas são muito mais poderosos do que os braceletes das demais Amazonas), e são absurdamente resistentes, indestrutíveis. Apenas em raríssimas ocasiões foram prejudicados, sendo que já repeliram os raios Ômega de Darkseid sem maiores danos", 11);
INSERT INTO equipamentos values ("ARCO E FLECHAS APRIMORADOS", "Um arco de altissima precisão e flechas com os efeitos mais diversos possíveis, desde explosivas às venenosas", 12);
INSERT INTO equipamentos values ("ARMAS DE FOGO E EXPLOSIVOS", "Armas de fogo comum e explosivos com alto poder de destruição ou até mesmo venenosos", 13);
INSERT INTO equipamentos values ("TRIDENTE DE ATLANTIS", "poder de comando do mar (fazendo ondas de maré ou redemoinhos ou mesmo fazendo colunas de água para se manter), controle o tempo (convocando chuva ou tempestades ou criando arco-íris), desencadeiam explosões de relâmpago, transformar criaturas vivas em outras formas, e também pode fazer desaparecer as coisas", 14);
INSERT INTO equipamentos values ("BALAS DE KRIPTONITA", "As únicas balas que poderiam ferir o Super Man", 15);
INSERT INTO equipamentos values ("DUPLICATA AMARELA CORROMPIDA", "Detem as mesmas capacidades que o anel dos lanterna verde porêm com impureza amarela", 16);
INSERT INTO equipamentos values ("GRIMOIRE", "Fonte de todos os feitiços de Circe", 17);
INSERT INTO equipamentos values ("GÁS DO RISO", "Gás venenoso que mata quase que instantaneamente", 18); 

INSERT INTO especies values ("HUMANO", 1);
INSERT INTO especies values ("KORUGARANO",2);
INSERT INTO especies values ("MARCIANO",3);
INSERT INTO especies values ("ATLANTE",4);
INSERT INTO especies values ("KRIPTONIANO",5);
INSERT INTO especies values ("AMAZONA", 6);

insert into esconderijos values ("COVIL DA TROPA DOS LANTERNA AMARELA", 1);
insert into esconderijos values ("TORRE DA LEX CORP", 2);
INSERT INTO esconderijos values ("ESCONDERIJO DO CORINGA", 3);
insert into esconderijos values ("SALA SECRETA DO REVERSO",4);
INSERT INTO esconderijos values ("CONFINS DE ATLANTIS", 5);
INSERT INTO esconderijos values ("OLIMPO",6);
insert into esconderijos values ("MARTE", 7);
insert into esconderijos values ("ESCONDERIJO DE MERLYN",8);

insert into viloes values ("Eobard Thawne", "Flash Reverso", 1, 1, 4);
insert into viloes values ("Thaal Sinestro", "Sinestro", 2, 2, 1);
insert into viloes values ("Marcianos Brancos", "Marcianos Brancos", 3, 3, 7);
insert into viloes values ("Orm", "Mestre do oceano", 4, 4, 5);
insert into viloes values ("Arthur Fleck", "Coringa", 5, 1, 3);
insert into viloes values ("Alexander Joseph Luthor", "Lex Luthor", 6, 1, 2);
insert into viloes values ("Circe", "Circe", 7, 6, 6);
insert into viloes values ("Malcom Merlyn", "Merlyn", 8, 1, 8);

insert into herois values ("Hal Jordan", 2, "Lantena verde", 1, 2, 1);
insert into herois values ("Barry Allen", 1, "Flash II", 2, 1, 1);
insert into herois values ("John Jones", 2, "Caçador de marte", 3, 3, 3);
insert into herois values ("Arthur Curry", 2, "Aquaman", 4, 4, 5);
insert into herois values ("Bruce Wayne", 3, "Batman", 5, 5, 1);
insert into herois values ("Clark Kent", 2, "Superman", 6, 6, 5);
insert into herois values ("Diana Cristina De Medeiros", 3, "Mulher Maravilha", 7, 7, 6);
insert into herois values ("Oliver Queen", 1, "Arqueiro Verde", 8, 8, 1);

insert into ataques values ("23/03/2004", 1, 3, 5,5);
insert into ataques values ("17/09/2018", 2, 7, 4,4);
insert into ataques values ("30/05/2019", 3, 2, 6,6);
insert into ataques values ("21/08/2016", 4, 8, 8,8);

insert into ass_her_equip values (1,1);
insert into ass_her_equip values (2,2);
insert into ass_her_equip values (3,4);
insert into ass_her_equip values (5,5);
insert into ass_her_equip values (6,5);
insert into ass_her_equip values (7,5);
insert into ass_her_equip values (9,7);
insert into ass_her_equip values (10,7);
insert into ass_her_equip values (11,7);
insert into ass_her_equip values (12,8);

insert into ass_vil_equip values (1,4);
insert into ass_vil_equip values (2,16);
insert into ass_vil_equip values (4,14);
insert into ass_vil_equip values (5,18);
insert into ass_vil_equip values (5,13);
insert into ass_vil_equip values (6,13);
insert into ass_vil_equip values (6,15);
insert into ass_vil_equip values (7,17);
insert into ass_vil_equip values (8,12);

insert into ass_her_hab values (1,1);
insert into ass_her_hab values (1,2);
insert into ass_her_hab values (1,5);
insert into ass_her_hab values (1,6);
insert into ass_her_hab values (1,7);
insert into ass_her_hab values (2,2);
insert into ass_her_hab values (2,3);
insert into ass_her_hab values (2,4);
insert into ass_her_hab values (2,6);
insert into ass_her_hab values (2,5);
insert into ass_her_hab values (2,8);
insert into ass_her_hab values (3,5);
insert into ass_her_hab values (3,9);
insert into ass_her_hab values (3,10);
insert into ass_her_hab values (3,11);
insert into ass_her_hab values (3,6);
insert into ass_her_hab values (3,12);
insert into ass_her_hab values (3,14);
insert into ass_her_hab values (3,1);
insert into ass_her_hab values (3,3);
insert into ass_her_hab values (3,25);
insert into ass_her_hab values (4,12);
insert into ass_her_hab values (4,15);
insert into ass_her_hab values (4,2);
insert into ass_her_hab values (4,6);
insert into ass_her_hab values (4,16);
insert into ass_her_hab values (4,11);
insert into ass_her_hab values (4,17);
insert into ass_her_hab values (4,18);
insert into ass_her_hab values (4,28);
insert into ass_her_hab values (5,19);
insert into ass_her_hab values (5,3);
insert into ass_her_hab values (5,20);
insert into ass_her_hab values (6,4);
insert into ass_her_hab values (6,1);
insert into ass_her_hab values (6,15);
insert into ass_her_hab values (6,2);
insert into ass_her_hab values (6,9);
insert into ass_her_hab values (6,24);
insert into ass_her_hab values (6,25);
insert into ass_her_hab values (7,4);
insert into ass_her_hab values (7,6);
insert into ass_her_hab values (7,3);
insert into ass_her_hab values (7,12);
insert into ass_her_hab values (7,18);
insert into ass_her_hab values (7,15);
insert into ass_her_hab values (8,20);
insert into ass_her_hab values (8,4);
insert into ass_her_hab values (8,9);
insert into ass_her_hab values (8,12);
insert into ass_her_hab values (8,19);

insert into ass_her_hab values (1,22);
insert into ass_her_hab values (1,6);
insert into ass_her_hab values (1,4);
insert into ass_her_hab values (1,12);
insert into ass_her_hab values (1,15);
insert into ass_her_hab values (1,3);
insert into ass_her_hab values (1,2);
insert into ass_her_hab values (2,1);
insert into ass_her_hab values (2,21);
insert into ass_her_hab values (2,7);
insert into ass_her_hab values (2,6);
insert into ass_her_hab values (2,10);
insert into ass_her_hab values (3,26);
insert into ass_her_hab values (3,18);
insert into ass_her_hab values (3,11);
insert into ass_her_hab values (3,10);
insert into ass_her_hab values (3,6);
insert into ass_her_hab values (3,3);
insert into ass_her_hab values (4,3);
insert into ass_her_hab values (4,4);
insert into ass_her_hab values (4,6);
insert into ass_her_hab values (4,10);
insert into ass_her_hab values (4,12);
insert into ass_her_hab values (4,16);
insert into ass_her_hab values (4,17);
insert into ass_her_hab values (4,18);
insert into ass_her_hab values (4,28);
insert into ass_her_hab values (5,3);
insert into ass_her_hab values (5,6);
insert into ass_her_hab values (5,23);
insert into ass_her_hab values (6,3);
insert into ass_her_hab values (7,3);
insert into ass_her_hab values (7,5);
insert into ass_her_hab values (7,10);
insert into ass_her_hab values (7,11);
insert into ass_her_hab values (7,13);
insert into ass_her_hab values (7,16);
insert into ass_her_hab values (7,17);
insert into ass_her_hab values (7,29);
insert into ass_her_hab values (8,3);
insert into ass_her_hab values (8,6);
insert into ass_her_hab values (8,12);
insert into ass_her_hab values (8,20);

insert into ass_her_vulnera values (1,1);
insert into ass_her_vulnera values (2,2);
insert into ass_her_vulnera values (2,3);
insert into ass_her_vulnera values (3,4);
insert into ass_her_vulnera values (4,5);
insert into ass_her_vulnera values (5,7);
insert into ass_her_vulnera values (5,8);
insert into ass_her_vulnera values (5,9);
insert into ass_her_vulnera values (6,10);
insert into ass_her_vulnera values (7,11);
insert into ass_her_vulnera values (7,12);
insert into ass_her_vulnera values (8,11);
insert into ass_her_vulnera values (8,8);
insert into ass_her_vulnera values (8,9);
insert into ass_her_vulnera values (8,7);

insert into ass_vil_vulnera values (1,2);
insert into ass_vil_vulnera values (1,8);
insert into ass_vil_vulnera values (2,7);
insert into ass_vil_vulnera values (2,11);
insert into ass_vil_vulnera values (3,6);
insert into ass_vil_vulnera values (3,7);
insert into ass_vil_vulnera values (4,5);
insert into ass_vil_vulnera values (5,11);
insert into ass_vil_vulnera values (5,9);
insert into ass_vil_vulnera values (5,7);
insert into ass_vil_vulnera values (5,12);
insert into ass_vil_vulnera values (5,8);
insert into ass_vil_vulnera values (6,11);
insert into ass_vil_vulnera values (6,9);
insert into ass_vil_vulnera values (6,7);
insert into ass_vil_vulnera values (6,12);
insert into ass_vil_vulnera values (6,8);
insert into ass_vil_vulnera values (7,11);
insert into ass_vil_vulnera values (7,12);
insert into ass_vil_vulnera values (7,9);
insert into ass_vil_vulnera values (8,11);
insert into ass_vil_vulnera values (8,9);
insert into ass_vil_vulnera values (8,7);
insert into ass_vil_vulnera values (8,12);
insert into ass_vil_vulnera values (8,8);


