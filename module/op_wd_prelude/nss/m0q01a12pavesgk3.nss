int StartingConditional()
{
    int bCondition = GetIsObjectValid(GetMaster()) &&
                     GetIsObjectValid(GetPCSpeaker());
    return bCondition;
}

