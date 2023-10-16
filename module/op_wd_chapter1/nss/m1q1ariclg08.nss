int StartingConditional()
{
    int bCondition = GetLocalInt(GetModule(),"NW_G_M1Q1MainPlot") == 75 &&
                //Three creatures turned in
                 GetPCSpeaker() == GetLocalObject(OBJECT_SELF,"NW_L_oPrimary");
                 //last one turned in by this player
    return bCondition;
}

