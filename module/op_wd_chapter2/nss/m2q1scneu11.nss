// * Karathis Alive, Neurik has Journal
int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(GetModule(),"M2Q1KarathisIsDead") == 0
                 && GetIsObjectValid(GetItemPossessedBy(OBJECT_SELF,"M2Q1ITKARJOURN"));
	return l_iResult;
}

