//* Bran is Werewolf still, No ring

int StartingConditional()
{
	int l_iResult;

	l_iResult = (GetLocalInt(GetModule(),"M2Q1BranCured") == 0)
                && GetIsObjectValid(GetItemPossessedBy(OBJECT_SELF,"M2Q1ITRING02")) == 0;
	return l_iResult;
}
