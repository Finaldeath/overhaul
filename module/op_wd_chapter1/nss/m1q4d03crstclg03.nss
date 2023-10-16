int StartingConditional()
{
    object oWinner = GetLocalObject(GetArea(OBJECT_SELF),"NW_G_M1Q4D03WonContest");
    int bCondition = GetIsObjectValid(oWinner) &&
                     GetLocalInt(OBJECT_SELF,"L_TALKTIMES") > 0;
    return bCondition;
}
