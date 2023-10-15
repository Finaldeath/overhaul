int StartingConditional()
{
    int bCondition = GetLocalInt(GetModule(),"NW_G_M1Q0CEnemiesDestroyed") >= 4 &&
                     GetLocalInt(OBJECT_SELF, "NW_L_TALKLEVEL") == 0 &&
                     GetLocalInt(OBJECT_SELF,"NW_L_TALKTIMES") > 0;
    return bCondition;
}
