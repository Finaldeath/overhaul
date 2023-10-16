// * Alhelor Not Dead, Neurik has Tooth
int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(GetModule(),"M2Q1AlhelorIsDead") ==0
                 && GetIsObjectValid(GetItemPossessedBy(OBJECT_SELF,"M2Q1ITALHTOOTH"));
	return l_iResult;
}

