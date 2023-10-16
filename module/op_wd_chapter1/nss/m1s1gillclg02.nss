int StartingConditional()
{
    object oFirst = GetLocalObject(OBJECT_SELF,"NW_L_M1S1FirstSpoken");
    int bCondition = GetIsObjectValid(oFirst) &&
                      oFirst == GetPCSpeaker() &&
                      GetLocalInt(OBJECT_SELF,"NW_L_M1S1ItemsGiven") < 3 &&
                      GetLocalInt(GetModule(),"NW_G_M1S1SubPlot") < 100 &&
                      GetLocalInt(GetModule(),"nw_g_m1q1_Giles") < 40;
    return bCondition;
}
