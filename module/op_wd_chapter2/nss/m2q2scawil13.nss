//* Player does not have the 3 druid notes
int StartingConditional()
{
	int l_iResult;

	l_iResult = GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M2Q2ITDRUIDNOTE1")) == FALSE
              && GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M2Q2ITDRUIDNOTE2")) == FALSE
              && GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M2Q2ITDRUIDNOTE3")) == FALSE;
	return l_iResult;
}
