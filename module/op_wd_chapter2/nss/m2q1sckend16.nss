// checks to see if Kendrack's bounty job has been accepted
// and if the PC speaking to him is not the one who accepted it

int StartingConditional()
{
    int iPlot1 = GetLocalInt(OBJECT_SELF,"NW_KENDRACK_PLOT");
    object oPlayer = GetLocalObject(OBJECT_SELF,"PC_KENDRACK_PLOT");
    if ((iPlot1 == 1) && (oPlayer != GetPCSpeaker()))
    {
        return TRUE;
    }
    return FALSE;
}
