int StartingConditional()
{
    object oWinner = GetLocalObject(GetArea(OBJECT_SELF),"NW_G_M1Q4D03WonContest");
    int bCondition = GetIsObjectValid(oWinner) &&
                     GetPCSpeaker() != oWinner;
   return bCondition;
}
