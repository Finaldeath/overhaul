////// Third creature brought back by PC, 1st time talked to when this is true

int StartingConditional()
{
int l_iResult;

    l_iResult = GetLocalInt(GetPCSpeaker(),"NW_L_FenthickTalk")<3 &&
                GetLocalInt(GetModule(),"NW_G_M1Q1MainPlot") == 75 &&
                GetIsObjectValid(GetLocalObject(OBJECT_SELF,"NW_L_oPrimary")) &&
                 GetPCSpeaker() == GetLocalObject(OBJECT_SELF,"NW_L_oPrimary");
return l_iResult;
}



