//con_q5arzig_1
int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if (GetLocalInt(oPC, "X1_Q5PCKnowBoulder") == 1)
        return TRUE;
    return FALSE;
}
