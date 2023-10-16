int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oKey = GetItemPossessedBy(oPC, "q5_Tymo_Exit");
    if (GetIsObjectValid(oKey) == TRUE || GetLocalInt(GetModule(), "X1_TYMOEXITOPEN") == 1)
        return TRUE;
    return FALSE;
}
