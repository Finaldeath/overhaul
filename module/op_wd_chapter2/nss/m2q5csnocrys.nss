int StartingConditional()
{
	int l_iResult;

	l_iResult = GetIsObjectValid(GetItemPossessedBy(GetObjectByTag("M2Q5PGREENCHEST"),"M2Q05ICRYSSKULL")) == FALSE &&
                GetIsObjectValid(GetItemPossessedBy(GetObjectByTag("M2Q5PGREENCHEST"),"M2Q05ICRYSFROG")) == FALSE &&
                GetIsObjectValid(GetItemPossessedBy(GetObjectByTag("M2Q5PGREENCHEST"),"M2Q05ICRYSINSECT")) == FALSE &&
                GetIsObjectValid(GetItemPossessedBy(GetObjectByTag("M2Q5PGREENCHEST"),"M2Q05ICRYSEGG")) == FALSE;
	return l_iResult;
}
