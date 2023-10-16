//* Urth is Werewolf still, has ring

int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(GetModule(),"M2Q1UrthCured") == 0 && GetIsObjectValid(GetItemPossessedBy(OBJECT_SELF,"M2Q1ITRING01"));
	return l_iResult;
}
