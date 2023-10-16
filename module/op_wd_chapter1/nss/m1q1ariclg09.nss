int StartingConditional()
{
    int bCondition = GetLocalInt(GetModule(),"NW_G_M1Q1MainPlot") == 75 &&
                //Three creatures turned in
                 GetPCSpeaker() != GetLocalObject(OBJECT_SELF,"NW_L_oPrimary");
                 //last one not turned in by this player
    return bCondition;
}

