////Check if 2nd creature brought back, not by PC, first time talked to by PC when this is true

int StartingConditional()
{
int l_iResult;

    l_iResult = GetLocalInt(GetPCSpeaker(),"NW_L_FenthickTalk")<2 &&
                GetLocalInt(GetModule(),"NW_G_M1Q1MainPlot") == 50 &&
                GetIsObjectValid(GetLocalObject(OBJECT_SELF,"NW_L_oPrimary")) &&
                 GetPCSpeaker() != GetLocalObject(OBJECT_SELF,"NW_L_oPrimary");
return l_iResult;
}


