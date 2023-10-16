int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if ( GetLocalInt(oPC, "X1_q1dHulkKnowsPlayer") != 1)
        return TRUE;
    return FALSE;
}
