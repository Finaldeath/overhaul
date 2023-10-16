// if anyone in the PC's party has the mask artifact

int StartingConditional()
{
    object oMask;
    object oPC = GetFirstFactionMember(GetPCSpeaker(), FALSE);
    while (GetIsObjectValid(oPC))
    {
        oMask = GetItemPossessedBy(oPC, "x1mask");
        if (GetIsObjectValid(oMask))
        {
            return TRUE;
        }
        else oPC = GetNextFactionMember(GetPCSpeaker(), FALSE);
    }
    return FALSE;
}
