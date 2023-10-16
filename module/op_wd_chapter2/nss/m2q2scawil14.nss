//* Player does have the 3 druid notes
int StartingConditional()
{
	int l_iResult;

	l_iResult = GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M2Q2ITDRUIDNOTE1"))
              && GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M2Q2ITDRUIDNOTE2"))
              && GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M2Q2ITDRUIDNOTE3"));
	return l_iResult;
}
