int StartingConditional()
{
   int bCondition = GetIsObjectValid(GetLocalObject(GetArea(OBJECT_SELF),
                                                    "NW_G_M1Q4D03WonContest")) == FALSE &&
                    GetLocalInt(OBJECT_SELF,"L_TALKTIMES") > 0;
   return bCondition;
}
