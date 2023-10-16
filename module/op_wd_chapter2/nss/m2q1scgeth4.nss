//* Geth is Werewolf still, No ring

int StartingConditional()
{
	int l_iResult;

	l_iResult = (GetLocalInt(GetModule(),"M2Q1GethCured") == 0)
                && GetIsObjectValid(GetItemPossessedBy(OBJECT_SELF,"M2Q1ITRING03")) == 0;
	return l_iResult;
}
