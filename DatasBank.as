/**
 * INTRODUCTION DU JEU : TITRE DU JEU
 */

Datas.push(new LevelDatas(
	CreditsLevel,
	"30,130|610,130|610,430|30,430:0,1|1,2|2,3|3,0",
	"Made by <a href=\"http://neamar.fr\">Neamar</a>, designed by <a href=\"http://licoti2.free.fr\">Licoti</a>"));
	
/**
 * PREMIÈRE PARTIE DE JEU : EULER
 */
Datas.push(new LevelDatas(
	EulerPathLevel,
	"430,230|470,290|570,330|470,370|430,430|310,290|310,370:6,3|3,4|4,2|2,0|0,1|1,5|5,6",
	"Flèche tutoriel 1",
	"EULER_TUTO"
));
	
Datas.push(new LevelDatas(
	EulerPathLevel,
	"320,50|100,150|540,150|100,430|540,430:0,1|0,2|1,2|1,3|1,4|2,3|2,4|3,4",
	"Maison"));
	
Datas.push(new LevelDatas(
	EulerPathLevel,
	"320,34|260,101|380,101|200,169|320,169|440,169|140,236|260,236|380,236|500,236|80,304|200,304|320,304|440,304|560,304|260,371|380,371|200,439|320,439|440,439:0,1|0,2|1,2|1,3|1,4|2,4|2,5|3,6|3,7|3,4|4,5|5,8|5,9|6,10|6,11|6,7|7,11|7,12|8,9|8,12|8,13|9,13|9,14|10,11|11,12|12,13|13,14|12,15|12,16|15,17|15,16|15,18|16,18|16,19|17,18|18,19",
	"Sierpiński Graph http://mathworld.wolfram.com/SierpinskiGraph.html"));	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
/**
 * DEUXIÈME PARTIE DE JEU : HAMILTON
 */

 Datas.push(new LevelDatas(
	HamiltonLevel,
	"570,330|570,390|510,440|510,280|430,310|430,410|250,330|250,390:6,4|4,5|5,7|7,1|1,0|0,3|3,2|2,1|6,0|6,7",
	"Flèche Tutorial Hamilton",
	"HAMILTON_TUTO"));
	
Datas.push(new LevelDatas(
	HamiltonLevel,
	"320,40|111,172|191,418|449,418|529,172|280,240|360,240:0,1|1,2|2,3|3,4|4,0|0,5|0,6|1,6|2,6|3,5|4,5",
	"Moser Spindle http://mathworld.wolfram.com/MoserSpindle.html"));

Datas.push(new LevelDatas(
	HamiltonLevel,
	"239,50|60,240|239,430|531,358|531,122|280,145|190,240|280,335|425,299|425,181|320,240:0,1|1,2|2,3|3,4|4,0|0,6|0,9|1,5|1,7|2,6|2,8|3,7|3,9|4,5|4,8|5,10|6,10|7,10|8,10|9,10",
	"Grötzsch graph http://mathworld.wolfram.com/GroetzschGraph.html"));
	
Datas.push(new LevelDatas(
	EndLevel,
	"",
	":)",
	"END"));

//Doily http://home.wlu.edu/~mcraea/Finite_Geometry/Applications/Prob33Walks/doily.gif
//NON EULERIEN / NON HAMILTONIEN
//addChild(new EulerPathLevel("382,50|158,122|158,358|382,430|520,240|267,78|150,240|267,402|458,340|458,140|283,126|200,240|283,354|417,311|417,169:4,9|9,0|0,5|5,1|1,6|6,2|2,7|7,3|3,8|8,4|0,7|5,3|1,8|6,4|2,9|5,11|5,14|6,10|6,12|7,11|7,13|8,12|8,14|9,10|9,13"));