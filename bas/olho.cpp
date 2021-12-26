// Adventure
// O OLHO PERDIDO DO TOTEM INCA
//
// por jonatas de mello
// jonatas@uol.com.br
//

//#############################################################################
// Includes
#include <conio.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

//#############################################################################
// Prototipos de Função
int instrucoes(void);
int locais(int local);
int bad_command(void);
int listar(void);
int pegar(void);
int deixar(void);
int puxar(void);
int nadar(void);
int acender(void);
int matar(void);
int caveira(void);
int mover(void);
int desistir(void);
int ajudar(void);
int abrir(void);
int ler_entrada(void);

int mostrar(void);

//#############################################################################
// Variáveis Globais
// Nome	Descrição	
// NB		Número de objetos do adventure, usado para dimensionar matrizes e laços FOR...NEXT	

int N,S,E,W;	// Saídas do local (1=há saída, 0=sem saída)	

int IN;		// Número de objetos carregados pelo jogador	
int L;		// Local onde o jogador se encontra no momento	
int LA;		// Sinalizador do estado da lâmpada (1=acesa, 0=apagada)	
int TA;		// Sinalizador do coletor de impostos	

int I;		// Contém número correspondente a um verbo, usado para selecionar a rotina adequada	

char I$[50]; // Entrada completa do jogador, antes de ser dividida em verbo e substantivo	
char V$[25]; // verbo em I$
char N$[25]; // substantivo em N$

int fim;	// para terminar o jogo

//#############################################################################
// CONSTANTES - numero de objetos e verbos
#define NB 7
#define NV 21

//#############################################################################
// Respostas do usuario (verbos)
typedef struct tagVerbos{
	char* R$;
	int R;
}tpVerbos;

tpVerbos VERBOS[NV] = {
	{"NADAR",5}, {"ABRIR",6}, {"ACENDER",7}, {"DESISTIR",8}, {"LISTAR",9},
	{"MATAR",10}, {"ATIRAR",10}, {"AJUDAR",11}, {"PEGAR",2}, {"APANHAR",2},
	{"CARREGAR",2}, {"COLOCAR",3}, {"DEIXAR",3}, {"LARGAR",3}, {"PUXAR",4},
	{"NORTE",1}, {"SUL",1}, {"LESTE",1}, {"OESTE",1}, {"SAIR",8}, {"TEMOS",9}
};
//#############################################################################
/* Cada verbo tem uma descricao e um número. 
Dois verbos com o mesmo numero representam a mesma ação. 
*/

//#############################################################################
// Objetos
typedef struct tagObjetos{
	int OB;
	char OB$[20];
	char SI$[50];
}tpObjetos;

tpObjetos OBJETOS[NB] = { 
	{4,"SACO","Ha um saco de bolas de gude aqui"},
	{14,"TIJOLO","Tem um tijolo no chao"},
	{24,"CORRENTE","Ha uma corrente pendurada sobre o trono"},
	{0,"REVOLVER","Tem um revolver no chao"},
	{0,"OLHO","Um olho cravejado de brilhantes esta no chao"},
	{22,"LANTERNA","Tem uma lanterna no chao"},
	{0,"CAVEIRA","De repente surge um surge uma Caveira"},
};

//#############################################################################
/* Estutura de Cada Objeto:
- o número de posição onde foi inicialmente colocado, 
- seu nome (ou descrição curta) e, 
- a descrição detalhada do objeto. 

O primeiro valor representa:
	- o número do local onde o objeto está (numero da sala)
	- O objeto tem valor -1 quando o jogador o pega (ou está carregando) 
	- tem valor 0 quando o objeto está escondido.
*/

//#############################################################################
int main(void)
{
	char ch;
	int i;
	fim=0;
	I=0; 
	TA=0; // CAVEIRA
	
	L=7;
//	L=15; //posicao inicial	
	//	instrucoes();
	system("cls");
	while (fim != 1){

/*
291 '
300 '   ACHAR LOCAL
305 '
310 CLS
320 IF INT(RND(1) * 15 + 1) = 1 AND TA = 0 THEN OB(7) = L: TA = 1
330 IF L < 11 THEN ON L GOSUB 0, 0, 0, 5020, 0, 0, 5050, 5080, 0, 5110: GOTO 370
340 IF L < 21 THEN ON L - 10 GOSUB 5140, 0, 0, 5180, 5210, 5240, 5270, 5300, 0, 0: GOTO 370
350 IF L < 26 THEN ON L - 20 GOSUB 0, 5330, 0, 5360
355 '
*/
	
//	sortear aparecimento da caveira.
	i = (int) rand()%15;
	if (  i == 5 && TA==0 )
	{
		OBJETOS[6].OB = L;
		TA = 1; // para só aparecer uma vez;
	}
//	printf("\n caveira = %d\n",i);

		locais(L);
/*	
360 '   COLOCA OBJETO NO LUGAR
365 '
370 FOR I = 1 TO NB: IF OB(I) = L THEN PRINT SI$(I)
380 NEXT
*/
	for (i=0; i<NB; i++)
		if ( OBJETOS[i].OB == L ) // o objeto está no local? entao mostrar
			printf("\n Aqui tem: %s \n", OBJETOS[i].OB$);
			
	mostrar();
		
/*
385 '
390 '     INDICA DIRECOES
395 '
400 IF L <> 11 OR (LA = 1 AND OB(2) = -1) THEN PRINT : PRINT "Pode seguir ";  ELSE 460
410 IF N > 0 THEN PRINT TAB(13); "NORTE"
420 IF E > 0 THEN PRINT TAB(13); "LESTE"
430 IF S > 0 THEN PRINT TAB(13); "SUL"
440 IF W > 0 THEN PRINT TAB(13); "OESTE"
*/
	// indicar direcoes
	// if (L != 11 || (LA==1 && OBJETOS[2].OB == -1) ) 
	printf("\n Voce pode seguir :\n"); // else?
	if (N>0) printf("\t NORTE \n");
	if (E>0) printf("\t LESTE \n");
	if (S>0) printf("\t SUL \n");
	if (W>0) printf("\t OESTE \n");
	
/*
445 '
450 '   INSTRUCOES
455 '
460 PRINT : PRINT "Para onde "; : INPUT I$
470 GOSUB 3010
480 IF OB(7) = L AND I <> 10 THEN 1590
*/
	fflush ( stdin );

	printf("\n Para onde? ");
	gets(I$);
	ler_entrada();
	
//	system("pause");
//	exit(0);

/*
490 '
500 '    OPCAO
504 '
505 IF I = 0 THEN GOTO 520
510 ON I GOTO 1010, 1150, 1240, 1310, 1410, 1460, 1500, 1360, 1080, 1550, 3110
520 PRINT : PRINT " - EU SOU BURRO, NAO ENTENDO "; V$; " - ": GOTO 370
*/

	// ler opção
	//140 DATA NADAR,5,ABRIR,6,ACENDER,7,DESISTIR,8,LISTAR,9,MATAR,10,ATIRAR,10,AJUDAR,11
	//145 DATA PEGAR,2,APANHAR,2,CARREGAR,2,COLOCAR,3,DEIXAR,3,LARGAR,3,PUXAR,4
	//150 DATA NORTE,1,SUL,1,LESTE,1,OESTE,1
	
//	system("cls");
	switch (I) {
		case 0:
			bad_command();
			// goto 370 - colocar objetos no lugar
			break;
		case 1:	// verbos NORTE,SUL,LESTE,OESTE
			mover();
			// goto 310 - achar local
			break;
		case 2:
			pegar();
			break;
		case 3:
			deixar();
			break;
		case 4:
			puxar();
			break;
		case 5:
			nadar();
			break;
		case 6:
			abrir();
			break;
		case 7:
			acender();
			break;
		case 8:
			desistir();
			break;
		case 9:
			listar();
			break;
		case 10:
			matar();
			break;
		case 11:
			ajudar();
			break;
		}
		
	}// while		

}//main
//#############################################################################

//#############################################################################
int bad_command(void)
{
	printf("\n - EU NAO ENTENDO [ %s ] - \n", V$);
	return 0;
}
//#############################################################################

//#############################################################################
int mover(void)
{			
/*
530 '
1000 '     MOVIMENTO
1001 '
1010 IF I$ = "N" AND N > 0 THEN L = L - 6: GOTO 310
1020 IF I$ = "L" AND L > 0 THEN L = L + 1: GOTO 310
1030 IF I$ = "S" AND S > 0 THEN L = L + 6: GOTO 310
1040 IF I$ = "O" AND W > 0 THEN L = L - 1: GOTO 310
1045 '
1050 '  CAMINHO ERRADO
1055 '
1060 PRINT : PRINT " - SEU BURRO, ESTE CAMINHO NAO EXISTE. NAO ESTA VENDO ??? - ": GOTO 330
*/

  // caso seja um movimento, vai ser apenas uma letra.
	if (strcmp(I$,"N")==0 && (N>0) ) L = L - 6;
	else if (strcmp(I$,"L")==0 && (E>0) ) L = L + 1;
	else if (strcmp(I$,"S")==0 && (S>0) ) L = L + 6;
	else if (strcmp(I$,"O")==0 && (W>0) ) L = L - 1;
	else
    printf("\n\n\b - SEU BURRO, ESTE CAMINHO NAO EXISTE. NAO ESTA VENDO ??? - \n\n");
	// 310 - achar local
	// TEM QUE MUDAR AQUI.
	// goto 330 - achar local

	return 0;
}
//#############################################################################

//#############################################################################
int listar(void)
{
	int i,j;
	j=0;
	printf("\n\n Voce tem :\n");
	for (i=0; i<NB; i++)
		if (OBJETOS[i].OB == -1)
		{
			printf(" - %s; \n", OBJETOS[i].OB$ );
			j++;
		}
	if (j == 0) 
		printf(" - N A D A - \n");
	
	printf("\n");
	// retorna 330 - achar local
	return 0;
}
//#############################################################################

//#############################################################################
int pegar(void)
{
/*
1135 '
1140 '   PEGAR
1145 '
1150 FOR G = 1 TO NB
1160 IF INSTR(OB$(G), N$) = 1 THEN GOTO 1190
1170 NEXT
1180  PRINT N$; " ??? ": GOTO 330
1190 IF OB(G) = -1 THEN PRINT "Ta' na mao, chefia!": GOTO 330
1200 IF OB(G) <> L THEN PRINT "Nao esta' aqui, SEU CEGO ": GOTO 330
1210 PRINT "OK": OB(G) = -1
1220 GOTO 330
*/

	int i, achou, pos;
	achou=0; pos=-1;
	for (i=0; i<NB; i++)
		if (strcmp(OBJETOS[i].OB$, N$)==0 )
		{
			achou=1;
			pos = i; //guarda a posicao do objeto no vetor
		}

	if (achou == 1)
	{	
		if ( OBJETOS[pos].OB == -1 ) // já pegou o objeto
		{
			printf("\n Ja' ta' na mao, chefia! \n");	// GOTO 330;
			return 0;
		}
		if ( OBJETOS[pos].OB != L ) // o objeto nao esta mais aqui
		{
			printf("\n Este objeto nao esta' aqui, SEU CEGO. \n");//: GOTO 330;
			return 0;
		}
		printf("\n OK \n"); // pegou
		OBJETOS[pos].OB = -1;
	}
	else // nao existe este objeto
		 printf("\n Eu nao sei o que e' %s ??? \n",N$);

	// retorna 330 - achar local
	return 0;
}
//#############################################################################

//#############################################################################
int deixar(void)
{
/*
1225 '
1230 '   DEIXAR
1235 '
1240 FOR G = 1 TO NB
1250 IF INSTR(OB$(G), N$) = 1 THEN 1270
1260 NEXT: PRINT " ??? ": GOTO 330
1270 IF OB(G) <> -1 THEN PRINT "Voce e' BURRO? Voce nao pode "; V$; " o que nao tem": GOTO 330
1280 PRINT "OK"; OB(G) = L
1290 GOTO 330
*/
	int i, achou, pos;
	achou=0; pos=-1;
	for (i=0; i<NB; i++)
		if (strcmp(OBJETOS[i].OB$, N$)==0 )
		{
			achou=1;
			pos = i; //guarda a posicao do objeto no vetor
		}

	if (achou == 1)
	{	
		if ( OBJETOS[pos].OB != -1 ) // o objeto nao esta mais aqui
		{
			printf("\n Voce e' BURRO? Voce nao pode %s o que nao tem!!! \n",V$);
			return 0;
		}
		printf("\n OK \n"); // largar
		OBJETOS[pos].OB = L; 	// deixa o objeto no lugar onde o jogador esta
	}
	else // nao existe este objeto
		printf("\n Eu nao sei o que e' %s ??? \n",N$);

	// retorna 330 - achar local
	return 0;
}
//#############################################################################

//#############################################################################
int puxar(void)
{
/*
1295 '
1300 '   PUXAR
1305 '
1310 IN = INSTR("ALAVANCA", N$): IF IN = 1 AND L <> 4 THEN PRINT "Nada acontece": GOTO 400
1320 IF IN <> 1 THEN PRINT "Voce nao pode puxar isso!": GOTO 400
1330 IF OB(1) <> -1 THEN PRINT "A alavanca abriu um buraco no chao e voce caiu dentro dele.  Voce ja' era, cara!": GOTO 1360
*/
	char ch;
	int IN;
	
	IN = strcmp("CORRENTE", N$);
	
	if (IN==0 && L!=24) 
		printf("\n Nada acontece... \n"); //goto 400
	else if (IN != 0)
		printf("\n Voce nao pode puxar isso"); //goto 400
	else if (OBJETOS[4].OB != -1) // se não estiver com o olho, fim do jogo....
	{
		printf("\n A corrente abriu um buraco no chao \n e voce caiu dentro dele.\n Voce ja' era, cara!\n"); 
		printf("\n GAME OVER, fim da linha pra voce, otario....");
		ch=getchar();
		fim =1;
	}	
	else if (OBJETOS[4].OB == -1) // tem o olho, ganhou!
	{
		printf("\n Parabens - voce cumpriu a missao");
		ch=getchar();
		fim=1;
	}

	// retorna 330 - achar local
	return 0;
}
//#############################################################################

//#############################################################################
int desistir(void)
{
	char ch;
//	printf(" P A R A B E N S - Voce completou sua missao\n");
	printf("\n\nQuer jogar novamente? (S/N)\n");
	ch = getchar();
	
	fim=1;
	// retorna 330 - achar local
	return 0;
}
//#############################################################################

//#############################################################################
int nadar(void)
{
/*
1395 '
1400 '      NADAR
1405 '
1410 IF L <> 7 THEN PRINT "Para onde? ": GOTO 330
1420 IF OB(3) = -1 THEN PRINT "Voce esta andando no pantano quando comeca a afundar. Voce nao sabe que tijolos sao muito pesados para um fracote como voce? Voce afundou ... e MORREU!!!": GOTO 1360
1430 IF OB(4) > -1 THEN PRINT "Voce achou um bumerangue": OB(4) = -1: GOTO 330
1440 PRINT "Voce esta todo molhado, cuidado para nao derreter florzinha...": GOTO 330
*/

	char ch;
	
	if ( L == 7 )	// só é possível nadar no local 7 onde tem um rio
	{
		if( OBJETOS[1].OB == -1)	 //carrega o tijolo?
		{
			printf("\nVoce esta andando no pantano quando comeca a afundar.\n");
			printf("\nVoce nao sabe que tijolos sao muito pesados para um fracote como voce?\n");
			printf("\nVoce afundou ... e MORREU!!!\n");
			ch=getchar();
			fim = 1;
		}
		else
		if (OBJETOS[3].OB > -1) // não carrega o revolver
		{
			printf("\n Voce achou um REVOLVER no chao\n");
			OBJETOS[3].OB = -1; // pega o objeto
		}
		else
			printf("\nVoce esta todo molhado, cuidado para nao derreter florzinha...\n");
		
	}
	else
		printf("\n Para onde? Vai nadar no seco???\n");
		
	return 0;
}
//#############################################################################

//#############################################################################
int abrir(void)
{
/*
1445 '
1450 '        ABRIR
1455 '
1460 IN = INSTR("CAIXA", N$): IF IN <> 1 THEN PRINT "Isto nao pode ser esvaziado": GOTO 330
1470 IF OB(6) <> -1 THEN G = 1: GOTO 1270
1480 PRINT "Dentro da caixa ha um olho de diamantes": OB(1) = L: GOTO 370
*/
	char ch;
	int IN;
	
	IN = strcmp("SACO", N$);
	
	if (IN != 0)
		printf("\n Voce nao pode abrir isso"); //goto 400
	else
		if ( OBJETOS[0].OB != -1) // nao leva o saco
			printf("\n Voce nao pode abrir o que não tem");
		else
			if (OBJETOS[0].OB == -1 )
			{	
				printf("\n As bolinhas se espalham pelo chao");
				OBJETOS[4].OB = L;
			}
				
	// retorna 330 - achar local
	return 0;
}
//#############################################################################

//#############################################################################
int acender(void)
{
/*
1485 '
1490 '           ACENDER
1495 '
1500 IN = INSTR("LANTERNA", N$): IF IN <> 1 THEN PRINT "Nao pode ser feito": GOTO 330
1510 IF OB(2) <> -1 THEN G = 6: GOTO 1270
1520 IF LA = 1 THEN PRINT "Ja' esta' acesa": GOTO 330
1530 LA = 1: PRINT "OK": GOTO 330
*/

	char ch;
	int IN;
	
	IN = strcmp("LANTERNA", N$);
	
	if (IN != 0)
		printf("\n Voce nao pode acender isso \n"); //goto 400
	else
		if ( OBJETOS[5].OB != -1) // nao leva a lanterna
			printf("\n Voce nao pode acender o que não tem \n");
		else
			if (OBJETOS[5].OB == -1 )
			{	
				printf("\n Acendeu!\n");
				LA=1;
			}

	// retorna 330 - achar local
	return 0;
}
//#############################################################################

//#############################################################################
int matar(void)
{
/*
1535 '
1540 '           MATAR
1545 '
1550 IF OB(4) <> -1 THEN PRINT "Com o que?": GOTO 320
1560 IF OB(7) <> L THEN PRINT "Quem?": GOTO 320
1570 PRINT "Voce acada de matar a "; OB$(7): OB(7) = 0: GOTO 330
*/
	// retorna 330 - achar local
	
	if ( OBJETOS[3].OB != -1 )
		printf("\n Com o que? \n");
	else
	if( OBJETOS[6].OB != L )
		printf("\n Quem?\n");
	else
	{
		printf("\n Voce acada de matar a %s.",OBJETOS[6].OB$);
		OBJETOS[6].OB = 0;
	}
	return 0;
}
//#############################################################################

//#############################################################################
int caveira(void)
{
/*
1575 '
1580 '           CAVEIRA
1585 '
1590 IN = 0: OB(7) = 0
1600 FOR K = 1 TO NB
1610 IF OB(K) = -1 THEN IN = IN + 1
1620 NEXT
1630 IF IN = 0 THEN PRINT "Como voce nao tem nada util, a caveira o prende nos calaboucos da masmorra para voce fazer compania aos mortos e, logo, juntar-se a eles...": GOTO 1360
1640 K = INT(RND(1) * NB + 1): IF OB(K) <> -1 THEN 1640
1650 PRINT "Ela toma o "; OB$(K); " de voce ": OB(K) = 0: GOTO 330
1660 '
*/
	char ch;
	int IN,k;

	IN=0;
	OBJETOS[6].OB=0;	
	for (k=0; k<NB; k++)
		if (OBJETOS[k].OB == -1)
			IN = IN+1;
			
	if ( IN == 0)
	{
		printf("Como voce nao tem nada util, \n a caveira o prende nos calaboucos da masmorra para \n voce fazer compania aos mortos e, logo, \n juntar-se a eles...");
		printf("\n GAME OVER, fim da linha pra voce, otario....");
		ch=getchar();
		fim=1;	
	}
	else
	{
		k = (int) ( rand() % NB );
		do{
		if ( OBJETOS[k].OB == -1 )
		{
			printf("\n Ela toma o %s de voce. \n",OBJETOS[k].OB$);
			OBJETOS[k].OB = 0;
		}
		else
			k = (int) ( rand() % NB );
		}while (OBJETOS[k].OB == -1);
	}
		

	// retorna 330 - achar local
	return 0;
}
//#############################################################################

//#############################################################################
int ler_entrada(void)
{
/*
3000 '           VERIFICACAO
3001 '
3010 N$ = "": I = INSTR(I$, " ")
3020 IF I = 0 THEN V$ = I$: GOTO 3050
3030 V$ = LEFT$(I$, I - 1)
3040 N$ = MID$(I$, I + 1)
3050 I = 0
3060 FOR K = 1 TO 19
3070 IF INSTR(R$(K), V$) = 1 THEN I = R(K): I$ = LEFT$(V$, 1)
3080 NEXT
3090 RETURN
*/
	int i;
	char *tmp;

	// O objetivo desta rotina é ler a entrada da usuário,
	// separar a entrada do usuario em VERBO e SUBSTANTIVO

printf("\n len: %d;",strlen(I$));
printf("\n antes: %s;",I$);
	
	// falta implementear - Uppercase()
	for (i=0; i<=strlen(I$); i++)
//		 if ( islower(I$[i]))
		 	 I$[i] = toupper(I$[i]);

//	I$[i++]='\0';
	
printf("\n depois: %s;",I$);	 	 	 

	
	I = 0;	// inicializar variaveis

	/* strcspn() = Scans string1 character by character, returning the number of characters 
	read until the first occurrence of any character included in string2.
	The search includes terminating null-characters, so the function will return 
	the length of string1 if none of the characters included in string2 is in string1
	*/
	
//	I = strspn(I$, " ");	// procura o espaco na string; Returns the length of the initial substring of string1 that is only composed of characters included in string2.
	I = strcspn(I$, " ");	// procura o 'espaco' na string; Returns the position in string1 of the first occurence of a component character of string2

	printf("\n I : %d ",I);
	
	if (I==strlen(I$))	// apenas o verbo
		strcpy(V$, I$);	// copiar para V$
	else
	{
		strncpy(V$,I$,I); // copia a parte do verbo para V$ (antes do espaco)
		
//		strcpy(tmp, I$);
		tmp = strtok(I$," ");
		strcpy(V$, tmp);
//		strcpy(V$,tmp);
		tmp = strtok(NULL," ");
		strcpy(N$, tmp);
	}
	
	printf("\n L=%d ; I=%d ; I$=%s ; V$=%s ; N$=%s \n",L,I,I$,V$,N$);
	
	I = 0;	// indicador do verbo
	for (i=0; i<NV; i++)
	{
//		printf("\n %s - %d",VERBOS[i].R$, VERBOS[i].R);
		if ( strcmp(VERBOS[i].R$, V$)==0 ) 
		{
			I = VERBOS[i].R;	// colocar em I o numero do verbo
			strncpy(I$,V$,1);	// copiar apenas o 1o caracter
			I$[1]='\0';
			printf("\n I=%d ; I$=%s ; V$=%s",I,I$,V$);
		}
	}
	printf("\n");
	
/*A parte final da sub-rotina, 
compara as respostas dadas com o conteúdo da matriz R$. 
Como sabemos, essa matriz contém as palavras indicativas 
das direções que podem ser seguidas. 
Depois você verá como fazer para expandir o conteúdo da matriz R$. 
Pela instrução da linha 3070, o programa verifica se há igualdade 
entre os conteúdos R$ e V$. Se houver, a variável I 
assume o valor de variável R. O programa reconhecerá a igualdade dos conteúdos 
verificando se o valor de I é maior que zero. A última parte da linha 3070 
retira a primeira letra de V$ e armazena-a na variável I$. 
A variável I$ será utilizada depois, para fazer com que o jogador se movimente.
*/
	return 0;
}
//#############################################################################

//#############################################################################
int ajudar(void)
{
	// Mostrar Ajuda
	printf("\n Os Verbos possiveis sao:\n");
	printf("NADAR,    ABRIR,    ACENDER, DESISTIR,\n");
	printf("LISTAR,   MATAR,    ATIRAR,  PEGAR,\n");
	printf("APANHAR,  CARREGAR, COLOCAR, DEIXAR,\n");
	printf("LARGAR,   PUXAR\n");
	
	return 0;
}
//#############################################################################

//#############################################################################
int locais(int local)
{
	//     LOCAIS
	// As variáveis N, S, L, e W, referem-se a norte, sul, leste e oeste. 
	// Elas podem tem um ou dois valores: 
	// 0: significa que não há saída naquela direção
	// 1: significa que há uma saída.
	
	switch (local) {
		case 4:
			printf("\n local: 4\n");
			//Voce esta do lado de fora de uma grande construcao
			printf("Voce esta do lado de fora de uma grande construcao.\n");
			N = 0; E = 0; S = 1; W = 0; 
			break;
		case 7:
			printf("\n local: 7\n");
			printf("Voce penetrou numa densa floresta. Ha' um rio aqui.\n");
			N = 0; E = 1; S = 0; W = 0; 
			break;
		case 8:
			printf("\n local: 8\n");
			printf("Voce esta numa floresta petrificada.\n");
			N = 0; E = 0; S = 1; W = 1; 
			break;
		case 10:
			printf("\n local: 10\n");
			// sala empoeirada
			printf("Voce esta numa sala muito suja.\n");
			N = 1; E = 1; S = 1; W = 0;
			break;
		case 11:
			printf("\n local: 11\n");
			printf("Voce esta' em um quarto escuro.\n");
//5150 IF OB(2) <> -1 OR LA <> 1 THEN N = 0: E = 0: S = 0: W = 0: PRINT "Esta' muito escuro para ver as saidas. Voce ficara preso aqui pelo resto de sua vida...": break;
			N = 0; E = 0; S = 1; W = 1;
			break;
		case 14:
			printf("\n local: 14\n");
			printf("Voce esta' em um atalho enlameado.\n");
			N = 1; E = 1; S = 0; W = 0;
			break;
		case 15:
			printf("\n local: 15\n");
			//portao
			printf("Voce esta na entrada da cidade oculta.\n");
			N = 0; E = 1; S = 0; W = 1; 
			break;
		case 16:
			printf("\n local: 16\n");
			printf("Voce esta' em um grande Hall. \n");
			N = 1; E = 1; S = 1; W = 1; 
			break;
		case 17:
			printf("\n local: 17\n");
			printf("Voce esta' no patio da cidade.\n");
			N = 1; E = 1; S = 0; W = 1; 
			break;
		case 18:
			printf("\n local: 18\n");
			printf("Voce entrou nos jardins da cidade.\n");
			N = 0; E = 0; S = 1; W = 1; 
			break;
		case 22:
			printf("\n local: 22\n");
			printf("Voce esta no guarda-loucas.\n");
			N = 1; E = 0; S = 0; W = 0; 
			break;
		case 24:
			printf("\n local: 24\n");
			printf("Voce esta na sala do trono.\n");
			N = 1; E = 0; S = 0; W = 0;
			break;
		default:
			printf("\n local nao definido.\n");
			break;
	}
	printf("\n");
	return 0;
}

//#############################################################################
int instrucoes(void)
{
// INSTRUCOES
	char ch;
	
	system("cls");
	printf("A BUSCA DO OLHO ENCANTADO\n\n");
	printf(" Voce e' um aventureiro que procura muitos tesouros. \n");
	printf(" Voce e' meio burro mas faz o que pode para ganhar a vida.\n");
	printf(" Voce decidiu ir para o Castelo da Morte para enfrentar o desconhecido,\n");
	printf(" pois ouviu falar que lá existe um antigo olho Inca cravejado de diamantes.\n");
	printf(" Mas parece que voce vai acabar encontrando muitos problemas...\n");
	
	ajudar();
	
	printf("\n\n TECLE [ENTER] PARA CONTINUAR"); 
	ch = getchar();
	return 0;
}
//#############################################################################

int mostrar(void)
{
	int i;
	
	printf("\n");
	for (i=0; i<NB; i++)
		printf (" %d - %s;\n",OBJETOS[i].OB, OBJETOS[i].OB$);	

	printf("\n");
}

