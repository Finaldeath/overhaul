int StartingConditional()
{
    int bCondition = GetLocalInt(GetModule(),"NW_G_M1Q1MainPlot") == 25 &&
                //One creature turned in
                 GetPCSpeaker() == GetLocalObject(OBJECT_SELF,"NW_L_oPrimary");
                 //by this player
    return bCondition;
}
