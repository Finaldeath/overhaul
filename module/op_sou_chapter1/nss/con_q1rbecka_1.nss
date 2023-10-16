int StartingConditional()
{
    object oDoor1 = GetObjectByTag("q1rumgutcage1");

    if (GetLocalInt(GetModule(), "X1_RUMGUTDEAD") == 1 && oDoor1 != OBJECT_INVALID
        && GetLocalInt(GetModule(), "X1_Q1RuralRebFree")> 70 && GetLocalInt(GetModule(), "X1_PCBeccaEscape") == 0)
        return TRUE;
    return FALSE;
}
