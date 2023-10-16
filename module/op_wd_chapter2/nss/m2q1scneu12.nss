// *  Neurik does not have Journal
int StartingConditional()
{
	int l_iResult;

	l_iResult =  GetIsObjectValid(GetItemPossessedBy(OBJECT_SELF,"M2Q1ITKARJOURN")) == 0;
	return l_iResult;
}
