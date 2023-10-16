int StartingConditional()
{
    object oAndrod = GetLocalObject(GetModule(),"NW_G_M1S2Androd");
	int bCondition = GetIsObjectValid(oAndrod) &&
                     !GetIsDead(oAndrod);
	return bCondition;
}

