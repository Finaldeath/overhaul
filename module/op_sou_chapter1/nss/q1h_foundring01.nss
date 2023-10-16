// if the PC has found the ring but not mentioned it to Farghan

int StartingConditional()
{
    object oRing = GetItemPossessedBy(GetPCSpeaker(), "q1ringwolf");
    int nPlot = GetLocalInt(OBJECT_SELF, "q1h_Saw_Ring");

    if ((GetIsObjectValid(oRing)) && (nPlot == 0))
    {
        return TRUE;
    }
    return FALSE;
}
