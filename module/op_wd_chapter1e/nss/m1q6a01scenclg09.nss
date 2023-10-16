int StartingConditional()
{
    int  bCondition = GetTag(OBJECT_SELF) == "M1Q6A01Fenthick" &&
                      GetLocalInt(OBJECT_SELF,"NW_L_Scene") == 2;
    return bCondition;
}
