// If Deekin is free and the PC has the shoe

int StartingConditional()
{
    int nFree = GetLocalInt(GetModule(), "q5_Deekin_Free");
    object oShoe = GetItemPossessedBy(GetPCSpeaker(), "q5_Deekin_Shoe");

    if ((nFree == 1) && (GetIsObjectValid(oShoe)))
    {
        return TRUE;
    }
    return FALSE;
}
