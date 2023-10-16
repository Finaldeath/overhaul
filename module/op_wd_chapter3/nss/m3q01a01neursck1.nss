int StartingConditional()
{
    int l_iResult;

    l_iResult = ( (GetLocalInt(GetModule(),"NW_G_M3Q01PLOTTRIALSTATUS") == 0)
        && (GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M3Q1TrialBook")) == FALSE));
 ////// AND PLAYER DOES NOT HAVE TRIAL NOTEBOOK IN POSSESSION
    return l_iResult;
}
