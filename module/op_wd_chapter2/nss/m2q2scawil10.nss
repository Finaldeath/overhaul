int StartingConditional()
{
	int l_iResult;

	l_iResult = GetIsObjectValid(GetItemPossessedBy(OBJECT_SELF,"M2Q2ITLEAFOAK"))
                && GetIsObjectValid(GetItemPossessedBy(OBJECT_SELF,"M2Q2ITLEAFWILLOW"))
                && GetIsObjectValid(GetItemPossessedBy(OBJECT_SELF,"M2Q2ITLEAFYEW")) ;
	return l_iResult;
}

