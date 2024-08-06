-- *********************************************
-- * SQL MySQL generation                      
-- *--------------------------------------------
-- * DB-MAIN version: 11.0.2              
-- * Generator date: Sep 14 2021              
-- * Generation date: Tue Apr 30 14:01:53 2024 
-- * LUN file: C:\Users\annalisa.franco3\OneDrive - Alma Mater Studiorum Università di Bologna\Didattica\Basi di dati\Esercitazioni\2023-2024\Challenge\tessiland_final.lun 
-- * Schema: Tessiland/Logico 
-- ********************************************* 


-- Database Section
-- ________________ 

create database Tessiland;
use Tessiland;


-- Tables Section
-- _____________ 

create table ARTICOLO (
     codice int not null auto_increment,
     titolo varchar(64) not null,
     data date not null,
     testo varchar(16000) not null,
     codSottocategoria int not null,
     constraint IDARTICOLO_ID primary key (codice));

create table AVVISO_DISPONIBILITA (
     riferimentoVerProdotto varchar(32) not null,
     emailUtente varchar(64) not null,
     constraint IDAVVISO_DISPONIBILITA primary key (emailUtente, riferimentoVerProdotto));

create table BUONO (
     punti int not null,
     importo int not null,
     constraint IDBUONO primary key (punti));

create table CARRELLO (
     riferimentoVerProdotto varchar(32) not null,
     emailUtente varchar(64) not null,
     quantità int not null,
     constraint IDCARRELLO primary key (riferimentoVerProdotto, emailUtente));

create table CATEGORIA (
     codice int not null auto_increment,
     nome varchar(64) not null,
     constraint IDCATEGORIA primary key (codice));

create table CATEGORIA_PRODOTTO (
     nome varchar(32) not null,
     descrizione varchar(256) not null,
     constraint IDCATEGORIA primary key (nome));

create table CODICE_PROMO (
     codice varchar(16) not null,
     descrizione varchar(256) not null,
     dataInizio date not null,
     dataFine date not null,
     tipo char(1) not null,
     sogliaOmaggio int,
     percentualeSconto float(1),
     riferimentoVerProdotto varchar(32) not null,
     constraint IDCODICE_PROMO primary key (codice));

create table COMPOSIZIONE (
     codProdotto int not null,
     codMateriale int not null,
     percentuale float(1) not null,
     constraint IDCOMPOSIZIONE primary key (codMateriale, codProdotto));

create table COMPOSIZIONE_KIT (
     riferimentoVerProdotto varchar(32) not null,
     codProdotto int not null,
     quantità int not null,
     constraint IDCOMPOSIZIONE_KIT primary key (codProdotto, riferimentoVerProdotto));

create table CORRELAZIONE (
     codProdotto2 int not null,
     codProdotto1 int not null,
     constraint IDCORRELAZIONE primary key (codProdotto1, codProdotto2));

create table CORRELAZIONE_ARTICOLO (
     codArticolo2 int not null,
     codArticolo1 int not null,
     constraint IDCORRELAZIONE_ARTICOLO primary key (codArticolo1, codArticolo2));

create table ETICHETTA (
     codProdotto int not null,
     nomeTag varchar(32) not null,
     constraint IDETICHETTA primary key (nomeTag, codProdotto));

create table FEEDBACK (
     codArticolo int not null,
     emailUtente varchar(64) not null,
     positivo char not null,
     commento varchar(1024) not null,
     constraint IDFEEDBACK primary key (emailUtente, codArticolo));

create table INDIRIZZO (
     emailUtente varchar(64) not null,
     alias varchar(64) not null,
     nome varchar(64) not null,
     cognome varchar(64) not null,
     indirizzo varchar(64) not null,
     numeroCivico varchar(8),
     codicePostale char(5) not null,
     città varchar(64) not null,
     telefono varchar(10) not null,
     azienda varchar(64),
     emailPEC varchar(64) not null,
     SDI varchar(64) not null,
     numIVA varchar(16) not null,
     codProvincia char(2) not null,
     codNazione char(3) not null,
     constraint IDINDIRIZZO primary key (emailUtente, alias));

create table LAVORAZIONE (
     codProdotto int not null,
     codStrumento int not null,
     constraint IDLAVORAZIONE primary key (codStrumento, codProdotto));

create table LISTA_DESIDERI (
     riferimentoVerProdotto varchar(32) not null,
     emailUtente varchar(64) not null,
     constraint IDLISTA_DESIDERI primary key (emailUtente, riferimentoVerProdotto));

create table MATERIALE (
     codMateriale int not null auto_increment,
     descrizione varchar(64) not null,
     constraint IDMATERIALE primary key (codMateriale));

create table METODO_PAGAMENTO (
     codice int not null auto_increment,
     descrizione varchar(256) not null,
     costo int,
     constraint IDMETODO_PAGAMENTO primary key (codice));

create table METODO_SPEDIZIONE (
     codice int not null auto_increment,
     nome varchar(64) not null,
     descrizione varchar(256) not null,
     costo int,
     immagine varchar(1024) not null,
     constraint IDMETODO_SPEDIZIONE primary key (codice));

create table MULTIMEDIA (
     codice int not null auto_increment,
     tipo char(1) not null,
     url varchar(1024),
     titolo varchar(256),
     nomeFile varchar(256),
     constraint IDMULTIMEDIA primary key (codice));

create table NAZIONE (
     codNazione char(3) not null,
     nome varchar(64) not null,
     constraint IDNAZIONE primary key (codNazione));

create table OFFERTA (
     codPromozione int not null,
     codProdotto int not null,
     percSconto float(1) not null,
     constraint IDOFFERTA primary key (codProdotto, codPromozione));

create table ORDINE (
     riferimento int not null auto_increment,
     data date not null,
     tracking varchar(64),
     punti_data date,
     punti_numPunti int,
     punti_stato varchar(64),
     nota_data date,
     nota_importo int,
     nota_stato varchar(64),
     codMetodoSpedizione int not null,
     codMetodoPagamento int not null,
     emailUtenteConsegna varchar(64) not null,
     aliasIndirizzoConsegna varchar(64) not null,
     emailUtenteFatturazione varchar(64),
     aliasIndirizzoFatturazione varchar(64),
     emailUtenteEsecuzione varchar(64) not null,
     constraint IDORDINE primary key (riferimento));

create table PRODOTTO (
     codProdotto int not null auto_increment,
     nome varchar(64) not null,
     prezzo int not null,
     peso float(1),
	 lunghezza float(1),
	 descrizione varchar(5000),
     kit char not null,
     nomeCategoria varchar(32) not null,
     constraint IDPRODOTTO primary key (codProdotto));

create table PROMOZIONE (
     codPromozione int not null auto_increment,
     dataOraInizio date not null,
     dataOraFine date not null,
     constraint IDPROMOZIONE primary key (codPromozione));

create table PROVINCIA (
     codProvincia char(2) not null,
     nome varchar(64) not null,
     constraint IDPROVINCIA primary key (codProvincia));

create table RECENSIONE (
     riferimentoVerProdotto varchar(32) not null,
     emailUtente varchar(64) not null,
     positivo char not null,
     commento varchar(1024) not null,
     constraint IDRECENSIONE primary key (emailUtente, riferimentoVerProdotto));

create table RICHIESTA (
     riferimentoOrdine int not null,
     riferimentoVerProdotto varchar(32) not null,
     quantità int not null,
     commento varchar(256),
     personalizzazione_1 varchar(256),
     reso_motivo varchar(256),
     reso_data date,
     constraint IDRICHIESTA primary key (riferimentoVerProdotto, riferimentoOrdine));

create table SCONTO_QUANTITA (
     codProdotto int not null,
     quantità int not null,
     sconto float(1) not null,
     constraint IDSCONTO_QUANTITA primary key (codProdotto, quantità));

create table SCONTO_UTENTE (
     codice varchar(16) not null,
     importo int not null,
     dataScadenza date not null,
     riferimentoOrdine int,
     emailUtente varchar(64) not null,
     constraint IDSCONTO_UTENTE primary key (codice));

create table SEZIONE (
     codArticolo int not null,
     numero int not null,
     titolo varchar(256) not null,
     testo varchar(16000) not null,
     constraint IDSEZIONE_ID primary key (codArticolo, numero));

create table SOGLIA_SPEDIZIONE (
     nome varchar(64) not null,
     importo int not null,
     constraint IDSOGLIA_SPEDIZIONE primary key (nome));

create table SOTTOCATEGORIA (
     codice int not null auto_increment,
     nome varchar(64) not null,
     codCategoria int not null,
     constraint IDSOTTOCATEGORIA primary key (codice));

create table SOTTOCATEGORIA_PRODOTTO (
     nomePadre varchar(32) not null,
     nomeFiglio varchar(32) not null,
     constraint IDSOTTOCATEGORIA_PRODOTTO primary key (nomePadre, nomeFiglio));

create table SOTTOSEZIONE (
     codArticolo int not null,
     numeroSezione int not null,
     numero int not null,
     titolo varchar(256) not null,
     testo varchar(16000) not null,
     constraint IDSOTTOSEZIONE primary key (codArticolo, numeroSezione, numero));

create table STEP_ORDINE (
     codice int not null auto_increment,
     stato varchar(64) not null,
     data date not null,
     rifOrdine int not null,
     constraint IDSTEP_ORDINE primary key (codice));

create table STRUMENTO (
     codStrumento int not null auto_increment,
     descrizione varchar(64) not null,
     constraint IDSTRUMENTO primary key (codStrumento));

create table SUGGERIMENTO_PRODOTTO (
     codArticolo int not null,
     numeroSezione int not null,
     numeroSottosezione int not null,
     riferimentoProdotto varchar(32) not null,
     constraint IDSUGGERIMENTO_PRODOTTO primary key (codArticolo, numeroSezione, numeroSottosezione, riferimentoProdotto));

create table TAG (
     nome varchar(32) not null,
     constraint IDTAG primary key (nome));

create table UTENTE (
     email varchar(64) not null,
     titolo varchar(8) not null,
     nome varchar(64) not null,
     cognome varchar(64) not null,
     dataNascita date,
     password varchar(512),
     newsletter char not null,
     constraint IDUTENTE primary key (email));

create table VERSIONE_PRODOTTO (
     riferimento varchar(32) not null,
     colore varchar(64) not null,
     disponibilità int not null,
     codProdotto int not null,
     constraint IDVERSIONE_PRODOTTO primary key (riferimento));

create table VISUALIZZAZIONE (
     codiceMultimedia int not null,
     codProdotto int not null,
     constraint IDVISUALIZZAZIONE primary key (codiceMultimedia, codProdotto));

create table VISUALIZZAZIONE_BLOG (
     codArticolo int not null,
     numeroSezione int not null,
     numeroSottosezione int not null,
     codiceMultimedia int not null,
     constraint IDVISUALIZZAZIONE_BLOG primary key (codArticolo, numeroSezione, numeroSottosezione, codiceMultimedia));


-- Constraints Section
-- ___________________ 

-- Not implemented
-- alter table ARTICOLO add constraint IDARTICOLO_CHK
--     check(exists(select * from SEZIONE
--                  where SEZIONE.codArticolo = codice)); 

alter table ARTICOLO add constraint FKappartenenzaSottocategoria
     foreign key (codSottocategoria)
     references SOTTOCATEGORIA (codice);

alter table AVVISO_DISPONIBILITA add constraint FKavv_UTE
     foreign key (emailUtente)
     references UTENTE (email);

alter table AVVISO_DISPONIBILITA add constraint FKavv_VER
     foreign key (riferimentoVerProdotto)
     references VERSIONE_PRODOTTO (riferimento);

alter table CARRELLO add constraint FKcar_UTE
     foreign key (emailUtente)
     references UTENTE (email);

alter table CARRELLO add constraint FKcar_VER
     foreign key (riferimentoVerProdotto)
     references VERSIONE_PRODOTTO (riferimento);

alter table CODICE_PROMO add constraint FKregalo
     foreign key (riferimentoVerProdotto)
     references VERSIONE_PRODOTTO (riferimento);

alter table COMPOSIZIONE add constraint FKcom_MAT
     foreign key (codMateriale)
     references MATERIALE (codMateriale);

alter table COMPOSIZIONE add constraint FKcom_PRO
     foreign key (codProdotto)
     references PRODOTTO (codProdotto);

alter table COMPOSIZIONE_KIT add constraint FKcom_PROKIT
     foreign key (codProdotto)
     references PRODOTTO (codProdotto);

alter table COMPOSIZIONE_KIT add constraint FKcom_VER
     foreign key (riferimentoVerProdotto)
     references VERSIONE_PRODOTTO (riferimento);

alter table CORRELAZIONE add constraint FK 
     foreign key (codProdotto1)
     references PRODOTTO (codProdotto);

alter table CORRELAZIONE add constraint FKcor_PRO
     foreign key (codProdotto2)
     references PRODOTTO (codProdotto);

alter table CORRELAZIONE_ARTICOLO add constraint FKarticolo2
     foreign key (codArticolo1)
     references ARTICOLO (codice);

alter table CORRELAZIONE_ARTICOLO add constraint FKarticolo1
     foreign key (codArticolo2)
     references ARTICOLO (codice);

alter table ETICHETTA add constraint FKeti_TAG
     foreign key (nomeTag)
     references TAG (nome);

alter table ETICHETTA add constraint FKeti_PRO
     foreign key (codProdotto)
     references PRODOTTO (codProdotto);

alter table FEEDBACK add constraint FKutente
     foreign key (emailUtente)
     references UTENTE (email);

alter table FEEDBACK add constraint FKarticolo
     foreign key (codArticolo)
     references ARTICOLO (codice);

alter table INDIRIZZO add constraint FKregistrazione
     foreign key (emailUtente)
     references UTENTE (email);

alter table INDIRIZZO add constraint FKappartenenzaProvincia
     foreign key (codProvincia)
     references PROVINCIA (codProvincia);

alter table INDIRIZZO add constraint FKappartenenzaNazione
     foreign key (codNazione)
     references NAZIONE (codNazione);

alter table LAVORAZIONE add constraint FKlav_STR
     foreign key (codStrumento)
     references STRUMENTO (codStrumento);

alter table LAVORAZIONE add constraint FKlav_PRO
     foreign key (codProdotto)
     references PRODOTTO (codProdotto);

alter table LISTA_DESIDERI add constraint FKlis_UTE
     foreign key (emailUtente)
     references UTENTE (email);

alter table LISTA_DESIDERI add constraint FKlis_VER
     foreign key (riferimentoVerProdotto)
     references VERSIONE_PRODOTTO (riferimento);

alter table OFFERTA add constraint FKoff_PRO_1
     foreign key (codProdotto)
     references PRODOTTO (codProdotto);

alter table OFFERTA add constraint FKoff_PRO
     foreign key (codPromozione)
     references PROMOZIONE (codPromozione);

alter table ORDINE add constraint FKspedizione
     foreign key (codMetodoSpedizione)
     references METODO_SPEDIZIONE (codice);

alter table ORDINE add constraint FKpagamento
     foreign key (codMetodoPagamento)
     references METODO_PAGAMENTO (codice);

alter table ORDINE add constraint FKconsegna
     foreign key (emailUtenteConsegna, aliasIndirizzoConsegna)
     references INDIRIZZO (emailUtente, alias);

alter table ORDINE add constraint FKfatturazione_FK
     foreign key (emailUtenteFatturazione, aliasIndirizzoFatturazione)
     references INDIRIZZO (emailUtente, alias);

alter table ORDINE add constraint FKfatturazione_CHK
     check((emailUtenteFatturazione is not null and aliasIndirizzoFatturazione is not null)
           or (emailUtenteFatturazione is null and aliasIndirizzoFatturazione is null)); 

alter table ORDINE add constraint FKesecuzione
     foreign key (emailUtenteEsecuzione)
     references UTENTE (email);

alter table ORDINE add constraint COEXORDINE
     check((punti_data is not null and punti_numPunti is not null and punti_stato is not null)
           or (punti_data is null and punti_numPunti is null and punti_stato is null)); 

alter table ORDINE add constraint COEXORDINE_1
     check((nota_data is not null and nota_importo is not null and nota_stato is not null)
           or (nota_data is null and nota_importo is null and nota_stato is null)); 

alter table PRODOTTO add constraint FKR
     foreign key (nomeCategoria)
     references CATEGORIA_PRODOTTO (nome);

alter table RECENSIONE add constraint FKrec_UTE
     foreign key (emailUtente)
     references UTENTE (email);

alter table RECENSIONE add constraint FKrec_VER
     foreign key (riferimentoVerProdotto)
     references VERSIONE_PRODOTTO (riferimento);

alter table RICHIESTA add constraint FKric_VER
     foreign key (riferimentoVerProdotto)
     references VERSIONE_PRODOTTO (riferimento);

alter table RICHIESTA add constraint FKric_ORD
     foreign key (riferimentoOrdine)
     references ORDINE (riferimento);

alter table RICHIESTA add constraint COEXRICHIESTA
     check((reso_motivo is not null and reso_data is not null)
           or (reso_motivo is null and reso_data is null)); 

alter table SCONTO_QUANTITA add constraint FKoffertaQuantit
     foreign key (codProdotto)
     references PRODOTTO (codProdotto);

alter table SCONTO_UTENTE add constraint FKriscossione
     foreign key (riferimentoOrdine)
     references ORDINE (riferimento);

alter table SCONTO_UTENTE add constraint FKcredito
     foreign key (emailUtente)
     references UTENTE (email);

-- Not implemented
-- alter table SEZIONE add constraint IDSEZIONE_CHK
--     check(exists(select * from SOTTOSEZIONE
--                  where SOTTOSEZIONE.codArticolo = codArticolo and SOTTOSEZIONE.numeroSezione = numero)); 

alter table SEZIONE add constraint FKappartenenzaSottosezione
     foreign key (codArticolo)
     references ARTICOLO (codice);

alter table SOTTOCATEGORIA add constraint FKappartenenzaCategoria
     foreign key (codCategoria)
     references CATEGORIA (codice);

alter table SOTTOCATEGORIA_PRODOTTO add constraint FKfiglio
     foreign key (nomeFiglio)
     references CATEGORIA_PRODOTTO (nome);

alter table SOTTOCATEGORIA_PRODOTTO add constraint FKpadre
     foreign key (nomePadre)
     references CATEGORIA_PRODOTTO (nome);

alter table SOTTOSEZIONE add constraint FKappartenenzaSezione
     foreign key (codArticolo, numeroSezione)
     references SEZIONE (codArticolo, numero);

alter table STEP_ORDINE add constraint FKRSTEP
     foreign key (rifOrdine)
     references ORDINE (riferimento);

alter table SUGGERIMENTO_PRODOTTO add constraint FKsug_VER
     foreign key (riferimentoProdotto)
     references VERSIONE_PRODOTTO (riferimento);

alter table SUGGERIMENTO_PRODOTTO add constraint FKsug_SOT
     foreign key (codArticolo, numeroSezione, numeroSottosezione)
     references SOTTOSEZIONE (codArticolo, numeroSezione, numero);

alter table VERSIONE_PRODOTTO add constraint FKdisponibilità
     foreign key (codProdotto)
     references PRODOTTO (codProdotto);

alter table VISUALIZZAZIONE add constraint FKvis_PRO
     foreign key (codProdotto)
     references PRODOTTO (codProdotto);

alter table VISUALIZZAZIONE add constraint FKvis_MUL
     foreign key (codiceMultimedia)
     references MULTIMEDIA (codice);

alter table VISUALIZZAZIONE_BLOG add constraint FKvis_MULBLOG
     foreign key (codiceMultimedia)
     references MULTIMEDIA (codice);

alter table VISUALIZZAZIONE_BLOG add constraint FKvis_SOT
     foreign key (codArticolo, numeroSezione, numeroSottosezione)
     references SOTTOSEZIONE (codArticolo, numeroSezione, numero);


-- Index Section
-- _____________ 

