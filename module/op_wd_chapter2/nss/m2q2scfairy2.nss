int StartingConditional()
{
	int l_iResult;
    object oPC = GetPCSpeaker();

	l_iResult =  (GetIsObjectValid(GetItemPossessedBy(oPC,"M2Q2ITRINGDRUID4")) == FALSE &&
                 GetLocalInt(GetModule(),"M2Q2_DRUIDARENA4") == 20) ||
                (GetIsObjectValid(GetItemPossessedBy(oPC,"M2Q2ITRINGDRUID3")) == FALSE &&
                 GetLocalInt(GetModule(),"M2Q2_DRUIDARENA3") == 20) ||
                (GetIsObjectValid(GetItemPossessedBy(oPC,"M2Q2ITRINGDRUID2")) == FALSE &&
                 GetLocalInt(GetModule(),"M2Q2_DRUIDARENA2") == 20) ||
                (GetIsObjectValid(GetItemPossessedBy(oPC,"M2Q2ITRINGDRUID1")) == FALSE &&
                 GetLocalInt(GetModule(),"M2Q2_DRUIDARENA1") == 20) ||
                (GetIsObjectValid(GetItemPossessedBy(oPC,"M2Q2ITRINGDRUID")) == FALSE &&
                 GetLocalInt(GetModule(),"M2Q2_DRUIDARENA") == 20) ;
	return l_iResult;
}
