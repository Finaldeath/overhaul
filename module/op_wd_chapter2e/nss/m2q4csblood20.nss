int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(GetArea(OBJECT_SELF),"NW_A_FamilyDeath") < 2 &&
                GetLocalInt(GetModule(),"NW_G_M2Q4WorkingForKurth") == 10 &&
                GetLocalInt(OBJECT_SELF,"NW_L_TellPCToAttack") == 20;
	return l_iResult;
}
