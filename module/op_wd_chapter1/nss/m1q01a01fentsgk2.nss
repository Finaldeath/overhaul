////Check if 1st creature brought back, not by PC, first time talked to by PC when this is true

int StartingConditional()
{
int l_iResult;

    l_iResult = GetLocalInt(GetPCSpeaker(),"NW_L_FenthickTalk")<1 &&
                GetLocalInt(GetModule(),"NW_G_M1Q1MainPlot") == 25 &&
                GetIsObjectValid(GetLocalObject(OBJECT_SELF,"NW_L_oPrimary")) &&
                 GetPCSpeaker() != GetLocalObject(OBJECT_SELF,"NW_L_oPrimary");
return l_iResult;
}

