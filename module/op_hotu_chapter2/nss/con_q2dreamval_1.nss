int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if (GetLocalInt(oPC, "nTalkingToDreamMatron") == 1)
        return TRUE;
    return FALSE;
}
