int StartingConditional()
{
    int l_iResult;

   l_iResult =( (GetLocalInt(GetModule(),"NW_G_M3Q01PLOTTRIALSTATUS") >= 2) ||
     (GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M3Q1TrialBook")) == TRUE));
   ////|| OR PLAYER HAVS TRIAL NOTEBOOK IN POSSESSION
    return l_iResult;
}

