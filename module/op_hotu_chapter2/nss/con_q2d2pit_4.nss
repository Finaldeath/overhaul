//con_q2d2pit_4
//Make sure PC has at least 500gp
int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if (GetGold(oPC) > 499)
        return TRUE;
    return FALSE;
}
