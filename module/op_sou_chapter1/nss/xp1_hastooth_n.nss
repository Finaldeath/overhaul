// the PC has the Tooth
// the PC has not mentioned the Tooth previously

int StartingConditional()
{
    object oTooth = GetItemPossessedBy(GetPCSpeaker(), "x1dragontooth");
    int nToothJob = GetLocalInt(GetPCSpeaker(), "Tooth_Quest");
    if ((GetIsObjectValid(oTooth)) && (nToothJob == 0))
    {
        return TRUE;
    }
    return FALSE;
}
