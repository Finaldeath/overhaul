// * Bran Alive, Bran Cured, Neurik has ring
int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(GetModule(),"M2Q1BranIsDead") == 0 && GetLocalInt(GetModule(),"M2Q1BranCured") == 1
                 && GetIsObjectValid(GetItemPossessedBy(OBJECT_SELF,"M2Q1ITRING02"));
	return l_iResult;
}
