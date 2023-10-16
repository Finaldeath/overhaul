int StartingConditional()
{
    object oPC = GetPCSpeaker();

    if (GetLocalInt(oPC,"X1_BEARSPOKE")==0 && GetLocalInt(GetModule(), "X1_PCSavedBear") == 1)
        return TRUE;
    return FALSE;

}
