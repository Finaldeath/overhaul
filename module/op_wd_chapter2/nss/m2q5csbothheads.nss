int StartingConditional()
{
	int l_iResult;

	l_iResult = GetIsObjectValid(GetItemPossessedBy(OBJECT_SELF,"M2Q05IBUGBHEAD")) == TRUE &&
                GetIsObjectValid(GetItemPossessedBy(OBJECT_SELF,"M2Q05IORCHEAD")) == TRUE;
	return l_iResult;
}
