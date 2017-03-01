// ****************************
// Wegbescreibungenin der Stadt
// ****************************


func void B_AddCityGuideChoices()
{
	Info_ClearChoices (DIA_CITYGUIDE);
	
	if (!C_IsQuarterNearest(self, Q_UNTERSTADT))
	{
		Info_AddChoice (DIA_CITYGUIDE, "Do dolnej czêœci miasta.", DIA_CITYGUIDE_UNTERSTADT);
	};
	if (!C_IsQuarterNearest(self, Q_OBERSTADT))
	{
		Info_AddChoice (DIA_CITYGUIDE, "Do górnego miasta.", DIA_CITYGUIDE_OBERSTADT);
	};
	if (!C_IsQuarterNearest(self, Q_TEMPEL))
	{
		Info_AddChoice (DIA_CITYGUIDE, "Do œwi¹tyni Adanosa.", DIA_CITYGUIDE_TEMPEL);
	};
	if (!C_IsQuarterNearest(self, Q_MARKT))
	{
		Info_AddChoice (DIA_CITYGUIDE, "Do targowiska.", DIA_CITYGUIDE_MARKT);
	};
	if (!C_IsQuarterNearest(self, Q_GALGEN))
	{
		Info_AddChoice (DIA_CITYGUIDE, "Do placu wisielców.", DIA_CITYGUIDE_GALGEN);
	};
	if (!C_IsQuarterNearest(self, Q_KASERNE))
	{
		Info_AddChoice (DIA_CITYGUIDE, "Do koszar.", DIA_CITYGUIDE_KASERNE);
	};
	if (!C_IsQuarterNearest(self, Q_HAFEN))
	{
		Info_AddChoice (DIA_CITYGUIDE, "Do dzielnicy portowej.", DIA_CITYGUIDE_HAFEN);
	};
	
	Info_AddChoice (DIA_CITYGUIDE, "Dziêki, tylko tyle chcia³em wiedzieæ.", DIA_CITYGUIDE_BACK);
};

INSTANCE DIA_CITYGUIDE (C_INFO)
{
	nr			= 700;
	condition	= DIA_CITYGUIDE_Condition;
	information	= DIA_CITYGUIDE_Info;
	permanent	= TRUE;
	description = "Co mo¿esz mi powiedzieæ o tym miejscu?";
};                       

FUNC INT DIA_CITYGUIDE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_CITYGUIDE_Info()
{	
	AI_Output (other, self, "DIA_CITYGUIDE_15_00"); //Co mo¿esz mi powiedzieæ o tym miejscu?
	
	// ------ Du bist jetzt ------
	if (C_NpcIsInQuarter(self) == Q_UNTERSTADT)
	{
		B_Say (self, other, "$UNTERSTADT"); 	//Jesteœ teraz w dolnej czêœci miasta.
	}
	else if (C_NpcIsInQuarter(self) == Q_OBERSTADT)
	{
		B_Say (self, other, "$OBERSTADT");		//Jesteœ teraz w górnym mieœcie.
	}
	else if (C_NpcIsInQuarter(self) == Q_TEMPEL)
	{
		B_Say (self, other, "$TEMPEL");			//Jesteœ teraz przy œwi¹tyni.
	}
	else if (C_NpcIsInQuarter(self) == Q_MARKT)
	{
		B_Say (self, other, "$MARKT");			//Jesteœ teraz na targowisku.
	}
	else if (C_NpcIsInQuarter(self) == Q_GALGEN)
	{
		B_Say (self, other, "$GALGEN");			//Jesteœ teraz na placu wisielców.
	}
	else if (C_NpcIsInQuarter(self) == Q_KASERNE)
	{
		B_Say (self, other, "$KASERNE");		//To s¹ koszary.
	}
	else if (C_NpcIsInQuarter(self) == Q_HAFEN)
	{
		B_Say (self, other, "$HAFEN");			//Jesteœ teraz w dzielnicy portowej.
	};
	
	B_Say (self, other, "$WHERETO"); //A gdzie siê wybierasz?
	
	B_AddCityGuideChoices();
};

func void DIA_CITYGUIDE_BACK()
{
	AI_Output (other, self, "DIA_CITYGUIDE_BACK_15_00"); //Dziêki, tylko tyle chcia³em wiedzieæ.
	Info_ClearChoices (DIA_CITYGUIDE);
};
	
func void DIA_CITYGUIDE_UNTERSTADT()	
{
	AI_Output (other, self, "DIA_CITYGUIDE_UNTERSTADT_15_00"); //Jak mogê siê dostaæ do dolnej czêœci miasta?
	
	if (C_NpcIsInQuarter(self) == Q_OBERSTADT)
	{
		B_Say (self, other, "$OBERSTADT_2_UNTERSTADT"); //PrzejdŸ przez wewnêtrzn¹ bramê, a dojdziesz do dolnej czêœci miasta.
	}
	else if (C_NpcIsInQuarter(self) == Q_TEMPEL)
	{
		B_Say (self, other, "$TEMPEL_2_UNTERSTADT");	//Od placu œwi¹tynnego odchodzi przejœcie prowadz¹ce do dolnej czêœci miasta.	
	}
	else if (C_NpcIsInQuarter(self) == Q_MARKT)
	{
		B_Say (self, other, "$MARKT_2_TEMPEL"); 		//Je¿eli pójdziesz wzd³u¿ murów miejskich od strony targowiska, to dojdziesz do œwi¹tyni.
		B_Say (self, other, "$TEMPEL_2_UNTERSTADT");	//Od placu œwi¹tynnego odchodzi przejœcie prowadz¹ce do dolnej czêœci miasta.
	}
	else if (C_NpcIsInQuarter(self) == Q_GALGEN)
	{
		B_Say (self, other, "$GALGEN_2_TEMPEL"); 		//IdŸ od strony placu wisielców w dó³ uliczk¹, a dojdziesz do placu œwi¹tynnego.
		B_Say (self, other, "$TEMPEL_2_UNTERSTADT");	//Od placu œwi¹tynnego odchodzi przejœcie prowadz¹ce do dolnej czêœci miasta.
	}
	else if (C_NpcIsInQuarter(self) == Q_KASERNE)
	{
		B_Say (self, other, "$KASERNE_2_GALGEN"); 		//Po prostu zejdŸ po schodach na prawo od g³ównego wejœcia, a dojdziesz do placu wisielców.
		B_Say (self, other, "$GALGEN_2_TEMPEL"); 		//IdŸ od strony placu wisielców w dó³ uliczk¹, a dojdziesz do placu œwi¹tynnego.
		B_Say (self, other, "$TEMPEL_2_UNTERSTADT");	//Od placu œwi¹tynnego odchodzi przejœcie prowadz¹ce do dolnej czêœci miasta.
	}
	else if (C_NpcIsInQuarter(self) == Q_HAFEN)
	{
		B_Say (self, other, "$HAFEN_2_UNTERSTADT");		//IdŸ od strony muru przy nabrze¿u w górê ulic¹ portow¹, a dojdziesz do dolnej czêœci miasta.
	};
	
	B_AddCityGuideChoices();
};

func void DIA_CITYGUIDE_OBERSTADT()	
{
	AI_Output (other, self, "DIA_CITYGUIDE_OBERSTADT_15_00"); //Jak dostaæ siê do górnego miasta?
	
	if (C_NpcIsInQuarter(self) == Q_UNTERSTADT)
	{
		B_Say (self, other, "$UNTERSTADT_2_OBERSTADT"); //Przy po³udniowej bramie znajduj¹ siê schody, które prowadz¹ do bramy wewnêtrznej. Za ni¹ zaczyna siê górne miasto.
	}
	else if (C_NpcIsInQuarter(self) == Q_TEMPEL)
	{
		B_Say (self, other, "$TEMPEL_2_UNTERSTADT");	//Od placu œwi¹tynnego odchodzi przejœcie prowadz¹ce do dolnej czêœci miasta.
		B_Say (self, other, "$UNTERSTADT_2_OBERSTADT"); //Przy po³udniowej bramie znajduj¹ siê schody, które prowadz¹ do bramy wewnêtrznej. Za ni¹ zaczyna siê górne miasto.
	}
	else if (C_NpcIsInQuarter(self) == Q_MARKT)
	{
		B_Say (self, other, "$MARKT_2_TEMPEL"); 		//Je¿eli pójdziesz wzd³u¿ murów miejskich od strony targowiska, to dojdziesz do œwi¹tyni.
		B_Say (self, other, "$TEMPEL_2_UNTERSTADT");	//Od placu œwi¹tynnego odchodzi przejœcie prowadz¹ce do dolnej czêœci miasta.
		B_Say (self, other, "$UNTERSTADT_2_OBERSTADT"); //Przy po³udniowej bramie znajduj¹ siê schody, które prowadz¹ do bramy wewnêtrznej. Za ni¹ zaczyna siê górne miasto.
	}
	else if (C_NpcIsInQuarter(self) == Q_GALGEN)
	{
		B_Say (self, other, "$GALGEN_2_TEMPEL"); 		//IdŸ od strony placu wisielców w dó³ uliczk¹, a dojdziesz do placu œwi¹tynnego.
		B_Say (self, other, "$TEMPEL_2_UNTERSTADT");	//Od placu œwi¹tynnego odchodzi przejœcie prowadz¹ce do dolnej czêœci miasta.
		B_Say (self, other, "$UNTERSTADT_2_OBERSTADT"); //Przy po³udniowej bramie znajduj¹ siê schody, które prowadz¹ do bramy wewnêtrznej. Za ni¹ zaczyna siê górne miasto.
	}
	else if (C_NpcIsInQuarter(self) == Q_KASERNE)
	{
		B_Say (self, other, "$KASERNE_2_GALGEN"); 		//Po prostu zejdŸ po schodach na prawo od g³ównego wejœcia, a dojdziesz do placu wisielców.
		B_Say (self, other, "$GALGEN_2_TEMPEL"); 		//IdŸ od strony placu wisielców w dó³ uliczk¹, a dojdziesz do placu œwi¹tynnego.
		B_Say (self, other, "$TEMPEL_2_UNTERSTADT");	//Od placu œwi¹tynnego odchodzi przejœcie prowadz¹ce do dolnej czêœci miasta.
		B_Say (self, other, "$UNTERSTADT_2_OBERSTADT"); //Przy po³udniowej bramie znajduj¹ siê schody, które prowadz¹ do bramy wewnêtrznej. Za ni¹ zaczyna siê górne miasto.
	}
	else if (C_NpcIsInQuarter(self) == Q_HAFEN)
	{
		B_Say (self, other, "$HAFEN_2_UNTERSTADT");		//IdŸ od strony muru przy nabrze¿u w górê ulic¹ portow¹, a dojdziesz do dolnej czêœci miasta.
		B_Say (self, other, "$UNTERSTADT_2_OBERSTADT"); //Przy po³udniowej bramie znajduj¹ siê schody, które prowadz¹ do bramy wewnêtrznej. Za ni¹ zaczyna siê górne miasto.
	};
	
	B_AddCityGuideChoices();
};
	
func void DIA_CITYGUIDE_TEMPEL()	
{
	AI_Output (other, self, "DIA_CITYGUIDE_TEMPEL_15_00"); //Szukam œwi¹tyni.
	
	if (C_NpcIsInQuarter(self) == Q_UNTERSTADT)
	{
		B_Say (self, other, "$UNTERSTADT_2_TEMPEL");	//IdŸ od strony kuŸni przez przejœcie, a dojdziesz do placu œwi¹tynnego.
	}
	else if (C_NpcIsInQuarter(self) == Q_OBERSTADT)
	{
		B_Say (self, other, "$OBERSTADT_2_UNTERSTADT"); //PrzejdŸ przez wewnêtrzn¹ bramê, a dojdziesz do dolnej czêœci miasta.
		B_Say (self, other, "$UNTERSTADT_2_TEMPEL");	//IdŸ od strony kuŸni przez przejœcie, a dojdziesz do placu œwi¹tynnego.
	}
	else if (C_NpcIsInQuarter(self) == Q_MARKT)
	{
		B_Say (self, other, "$MARKT_2_TEMPEL"); 		//Je¿eli pójdziesz wzd³u¿ murów miejskich od strony targowiska, to dojdziesz do œwi¹tyni.
	}
	else if (C_NpcIsInQuarter(self) == Q_GALGEN)
	{
		B_Say (self, other, "$GALGEN_2_TEMPEL"); 		//IdŸ od strony placu wisielców w dó³ uliczk¹, a dojdziesz do placu œwi¹tynnego.
	}
	else if (C_NpcIsInQuarter(self) == Q_KASERNE)
	{
		B_Say (self, other, "$KASERNE_2_MARKT"); 		//Po prostu zejdŸ po schodach na lewo od g³ównego wejœcia, a dojdziesz do targowiska.
		B_Say (self, other, "$MARKT_2_TEMPEL"); 		//Wenn du vom Marktplatz aus an der hohen Stadtmauer entlang gehst, kommst du zum Tempel.
	}
	else if (C_NpcIsInQuarter(self) == Q_HAFEN)
	{
		B_Say (self, other, "$HAFEN_2_UNTERSTADT");		//IdŸ od strony muru przy nabrze¿u w górê ulic¹ portow¹, a dojdziesz do dolnej czêœci miasta.
		B_Say (self, other, "$UNTERSTADT_2_TEMPEL");	//IdŸ od strony kuŸni przez przejœcie, a dojdziesz do placu œwi¹tynnego.
	};
	
	B_AddCityGuideChoices();
};
	
func void DIA_CITYGUIDE_MARKT()	
{
	AI_Output (other, self, "DIA_CITYGUIDE_MARKT_15_00"); //Gdzie jest targowisko?
	
	if (C_NpcIsInQuarter(self) == Q_UNTERSTADT)
	{
		B_Say (self, other, "$UNTERSTADT_2_TEMPEL");	//IdŸ od strony kuŸni przez przejœcie, a dojdziesz do placu œwi¹tynnego.
		B_Say (self, other, "$TEMPEL_2_MARKT"); 		//Kiedy bêdziesz przed œwi¹tyni¹, skrêæ w lewo i idŸ wzd³u¿ murów miejskich, a dojdziesz do targowiska.
	}
	else if (C_NpcIsInQuarter(self) == Q_OBERSTADT)
	{
		B_Say (self, other, "$OBERSTADT_2_UNTERSTADT"); //PrzejdŸ przez wewnêtrzn¹ bramê, a dojdziesz do dolnej czêœci miasta.
		B_Say (self, other, "$UNTERSTADT_2_TEMPEL");	//IdŸ od strony kuŸni przez przejœcie, a dojdziesz do placu œwi¹tynnego.
		B_Say (self, other, "$TEMPEL_2_MARKT"); 		//Kiedy bêdziesz przed œwi¹tyni¹, skrêæ w lewo i idŸ wzd³u¿ murów miejskich, a dojdziesz do targowiska.
	}
	else if (C_NpcIsInQuarter(self) == Q_TEMPEL)
	{
		B_Say (self, other, "$TEMPEL_2_MARKT"); 		//Kiedy bêdziesz przed œwi¹tyni¹, skrêæ w lewo i idŸ wzd³u¿ murów miejskich, a dojdziesz do targowiska.
	}
	else if (C_NpcIsInQuarter(self) == Q_GALGEN)
	{
		B_Say (self, other, "$GALGEN_2_MARKT"); 		//Po prostu przejdŸ obok koszar, a dojdziesz do targowiska.
	}
	else if (C_NpcIsInQuarter(self) == Q_KASERNE)
	{
		B_Say (self, other, "$KASERNE_2_MARKT"); 		//Po prostu zejdŸ po schodach na lewo od g³ównego wejœcia, a dojdziesz do targowiska.
	}
	else if (C_NpcIsInQuarter(self) == Q_HAFEN)
	{
		B_Say (self, other, "$HAFEN_2_UNTERSTADT");		//IdŸ od strony muru przy nabrze¿u w górê ulic¹ portow¹, a dojdziesz do dolnej czêœci miasta.
		B_Say (self, other, "$UNTERSTADT_2_TEMPEL");	//IdŸ od strony kuŸni przez przejœcie, a dojdziesz do placu œwi¹tynnego.
		B_Say (self, other, "$TEMPEL_2_MARKT"); 		//Kiedy bêdziesz przed œwi¹tyni¹, skrêæ w lewo i idŸ wzd³u¿ murów miejskich, a dojdziesz do targowiska.
	};
	
	B_AddCityGuideChoices();
};
	
func void DIA_CITYGUIDE_GALGEN()	
{
	AI_Output (other, self, "DIA_CITYGUIDE_GALGEN_15_00"); //Jak dostaæ siê na Plac Wisielców?
	
	if (C_NpcIsInQuarter(self) == Q_UNTERSTADT)
	{
		B_Say (self, other, "$UNTERSTADT_2_TEMPEL");	//IdŸ od strony kuŸni przez przejœcie, a dojdziesz do placu œwi¹tynnego.
		B_Say (self, other, "$TEMPEL_2_GALGEN"); 		//Je¿eli id¹c od strony œwi¹tyni, skrêcisz przy knajpie w lewo, dojdziesz do placu wisielców.
	}
	else if (C_NpcIsInQuarter(self) == Q_OBERSTADT)
	{
		B_Say (self, other, "$OBERSTADT_2_UNTERSTADT"); //PrzejdŸ przez wewnêtrzn¹ bramê, a dojdziesz do dolnej czêœci miasta.
		B_Say (self, other, "$UNTERSTADT_2_TEMPEL");	//IdŸ od strony kuŸni przez przejœcie, a dojdziesz do placu œwi¹tynnego.
		B_Say (self, other, "$TEMPEL_2_GALGEN"); 		//Je¿eli id¹c od strony œwi¹tyni, skrêcisz przy knajpie w lewo, dojdziesz do placu wisielców.
	}
	else if (C_NpcIsInQuarter(self) == Q_TEMPEL)
	{
		B_Say (self, other, "$TEMPEL_2_GALGEN"); 		//Je¿eli id¹c od strony œwi¹tyni, skrêcisz przy knajpie w lewo, dojdziesz do placu wisielców.
	}
	else if (C_NpcIsInQuarter(self) == Q_MARKT)
	{
		B_Say (self, other, "$MARKT_2_GALGEN"); 		//Po prostu przejdŸ obok koszar, a dojdziesz do placu wisielców.
	}
	else if (C_NpcIsInQuarter(self) == Q_KASERNE)
	{
		B_Say (self, other, "$KASERNE_2_GALGEN"); 		//Po prostu zejdŸ po schodach na prawo od g³ównego wejœcia, a dojdziesz do placu wisielców.
	}
	else if (C_NpcIsInQuarter(self) == Q_HAFEN)
	{
		B_Say (self, other, "$HAFEN_2_UNTERSTADT");		//IdŸ od strony muru przy nabrze¿u w górê ulic¹ portow¹, a dojdziesz do dolnej czêœci miasta.
		B_Say (self, other, "$UNTERSTADT_2_TEMPEL");	//IdŸ od strony kuŸni przez przejœcie, a dojdziesz do placu œwi¹tynnego.
		B_Say (self, other, "$TEMPEL_2_GALGEN"); 		//Je¿eli id¹c od strony œwi¹tyni, skrêcisz przy knajpie w lewo, dojdziesz do placu wisielców.
	};
	
	B_AddCityGuideChoices();
};
	
func void DIA_CITYGUIDE_KASERNE()	
{
	AI_Output (other, self, "DIA_CITYGUIDE_KASERNE_15_00"); //Gdzie s¹ koszary?
	
	if (C_NpcIsInQuarter(self) == Q_UNTERSTADT)
	{
		B_Say (self, other, "$UNTERSTADT_2_TEMPEL");	//IdŸ od strony kuŸni przez przejœcie, a dojdziesz do placu œwi¹tynnego.
		B_Say (self, other, "$TEMPEL_2_GALGEN"); 		//Je¿eli id¹c od strony œwi¹tyni, skrêcisz przy knajpie w lewo, dojdziesz do placu wisielców.
		B_Say (self, other, "$GALGEN_2_KASERNE");		//Koszary to ten wielki budynek. Dostaniesz siê do niego po schodach.
	}
	else if (C_NpcIsInQuarter(self) == Q_OBERSTADT)
	{
		B_Say (self, other, "$OBERSTADT_2_UNTERSTADT"); 	//PrzejdŸ przez wewnêtrzn¹ bramê, a dojdziesz do dolnej czêœci miasta.
		B_Say (self, other, "$UNTERSTADT_2_TEMPEL");	//IdŸ od strony kuŸni przez przejœcie, a dojdziesz do placu œwi¹tynnego.
		B_Say (self, other, "$TEMPEL_2_GALGEN"); 		//Je¿eli id¹c od strony œwi¹tyni, skrêcisz przy knajpie w lewo, dojdziesz do placu wisielców.
		B_Say (self, other, "$GALGEN_2_KASERNE");		//Koszary to ten wielki budynek. Dostaniesz siê do niego po schodach.
	}
	else if (C_NpcIsInQuarter(self) == Q_TEMPEL)
	{
		B_Say (self, other, "$TEMPEL_2_GALGEN"); 		//Je¿eli id¹c od strony œwi¹tyni, skrêcisz przy knajpie w lewo, dojdziesz do placu wisielców.
		B_Say (self, other, "$GALGEN_2_KASERNE");		//Koszary to ten wielki budynek. Dostaniesz siê do niego po schodach.
	}
	else if (C_NpcIsInQuarter(self) == Q_MARKT)
	{
		B_Say (self, other, "$MARKT_2_KASERNE");		//Koszary to ten wielki budynek. Dostaniesz siê do nich po schodach naprzeciwko gospody.
	}
	else if (C_NpcIsInQuarter(self) == Q_GALGEN)
	{
		B_Say (self, other, "$GALGEN_2_KASERNE");		//Koszary to ten wielki budynek. Dostaniesz siê do niego po schodach.
	}
	else if (C_NpcIsInQuarter(self) == Q_HAFEN)
	{
		B_Say (self, other, "$HAFEN_2_UNTERSTADT");		//IdŸ od strony muru przy nabrze¿u w górê ulic¹ portow¹, a dojdziesz do dolnej czêœci miasta.
		B_Say (self, other, "$UNTERSTADT_2_TEMPEL");	//IdŸ od strony kuŸni przez przejœcie, a dojdziesz do placu œwi¹tynnego.
		B_Say (self, other, "$TEMPEL_2_GALGEN"); 		//Je¿eli id¹c od strony œwi¹tyni, skrêcisz przy knajpie w lewo, dojdziesz do placu wisielców.
		B_Say (self, other, "$GALGEN_2_KASERNE");		//Koszary to ten wielki budynek. Dostaniesz siê do niego po schodach.
	};
	
	B_AddCityGuideChoices();
};
	
func void DIA_CITYGUIDE_HAFEN()	
{
	AI_Output (other, self, "DIA_CITYGUIDE_HAFEN_15_00"); //Jak dostaæ siê do portu?
	
	if (C_NpcIsInQuarter(self) == Q_UNTERSTADT)
	{
		B_Say (self, other, "$UNTERSTADT_2_HAFEN");		//IdŸ od strony kuŸni w dó³ ulic¹ portow¹, a dojdziesz do portu.
	}
	else if (C_NpcIsInQuarter(self) == Q_OBERSTADT)
	{
		B_Say (self, other, "$OBERSTADT_2_UNTERSTADT"); //PrzejdŸ przez wewnêtrzn¹ bramê, a dojdziesz do dolnej czêœci miasta.
		B_Say (self, other, "$UNTERSTADT_2_HAFEN");		//IdŸ od strony kuŸni w dó³ ulic¹ portow¹, a dojdziesz do portu.
	}
	else if (C_NpcIsInQuarter(self) == Q_TEMPEL)
	{
		B_Say (self, other, "$TEMPEL_2_UNTERSTADT");	//Od placu œwi¹tynnego odchodzi przejœcie prowadz¹ce do dolnej czêœci miasta.
		B_Say (self, other, "$UNTERSTADT_2_HAFEN");		//IdŸ od strony kuŸni w dó³ ulic¹ portow¹, a dojdziesz do portu.
	}
	else if (C_NpcIsInQuarter(self) == Q_MARKT)
	{
		B_Say (self, other, "$MARKT_2_TEMPEL"); 		//Je¿eli pójdziesz wzd³u¿ murów miejskich od strony targowiska, to dojdziesz do œwi¹tyni.
		B_Say (self, other, "$TEMPEL_2_UNTERSTADT");	//Od placu œwi¹tynnego odchodzi przejœcie prowadz¹ce do dolnej czêœci miasta.
		B_Say (self, other, "$UNTERSTADT_2_HAFEN");		//IdŸ od strony kuŸni w dó³ ulic¹ portow¹, a dojdziesz do portu.
	}
	else if (C_NpcIsInQuarter(self) == Q_GALGEN)
	{
		B_Say (self, other, "$GALGEN_2_TEMPEL"); 		//IdŸ od strony placu wisielców w dó³ uliczk¹, a dojdziesz do placu œwi¹tynnego.
		B_Say (self, other, "$TEMPEL_2_UNTERSTADT");	//Od placu œwi¹tynnego odchodzi przejœcie prowadz¹ce do dolnej czêœci miasta.
		B_Say (self, other, "$UNTERSTADT_2_HAFEN");		//IdŸ od strony kuŸni w dó³ ulic¹ portow¹, a dojdziesz do portu.
	}
	else if (C_NpcIsInQuarter(self) == Q_KASERNE)
	{
		B_Say (self, other, "$KASERNE_2_GALGEN"); 		//Po prostu zejdŸ po schodach na prawo od g³ównego wejœcia, a dojdziesz do placu wisielców.
		B_Say (self, other, "$GALGEN_2_TEMPEL"); 		//IdŸ od strony placu wisielców w dó³ uliczk¹, a dojdziesz do placu œwi¹tynnego.
		B_Say (self, other, "$TEMPEL_2_UNTERSTADT");	//Od placu œwi¹tynnego odchodzi przejœcie prowadz¹ce do dolnej czêœci miasta.
		B_Say (self, other, "$UNTERSTADT_2_HAFEN");		//IdŸ od strony kuŸni w dó³ ulic¹ portow¹, a dojdziesz do portu.
	};
	
	B_AddCityGuideChoices();
};

// *********************************************************
// ---------------------------------------------------------

func void B_AssignCityGuide (var C_NPC slf)
{
	DIA_CITYGUIDE.npc = Hlp_GetInstanceID(slf);
};

	
	


