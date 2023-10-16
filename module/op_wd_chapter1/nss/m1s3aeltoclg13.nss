int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bCondition = GetLocalInt(oPC,"NW_L_M1S3Tests") == 15;
    return bCondition;
}

