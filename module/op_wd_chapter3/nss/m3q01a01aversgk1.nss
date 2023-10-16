#include "NW_I0_PLOT"

int StartingConditional()
{
    int l_iResult;

    l_iResult =( (GetLocalInt(GetModule(),"NW_G_M3Q01PLOTTRIALSTATUS") == 0)
       && (GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M3Q1TrialBook")) == TRUE)
       && (GetLocalInt(GetPCSpeaker(),"TrialAccepted") ==1));
 ////// AND PLAYER HAS TRIAL NOTEBOOK IN POSSESSION
    return l_iResult;
}

