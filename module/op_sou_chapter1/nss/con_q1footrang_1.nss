int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if (GetLocalInt(oPC, "X1_QFootTalkRanger") != 1)
    {
        SetLocalInt(oPC, "X1_QFootTalkRanger", 1);
        return TRUE;
    }
    return FALSE;
}
