//con_q2dgate_2
int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if (GetLocalInt(oPC, "X2_Q2DMindShielded") == 1)
        return TRUE;
    return FALSE;
}
