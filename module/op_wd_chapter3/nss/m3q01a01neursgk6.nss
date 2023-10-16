////Player given notebook, does not have it any longer and trial not over

int StartingConditional()
{
    int l_iResult;

   l_iResult =( (GetLocalInt(GetModule(),"NW_G_M3Q01PLOTTRIALSTATUS") < 2) &&
     (GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M3Q1TrialBook")) == FALSE) &&
     GetLocalInt(GetPCSpeaker(),"TrialAccepted") ==1)
     && GetLocalInt(OBJECT_SELF,"NW_G_M3Q1_TRIAL_COMPLETE")==FALSE;

    return l_iResult;
}

