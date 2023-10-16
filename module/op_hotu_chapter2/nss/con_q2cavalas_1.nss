//con_q2cavalas_1
int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if (GetLocalInt(oPC, "X2_PCKnowsIsleOfTheMaker") == 1)
        return TRUE;
    return FALSE;
}
