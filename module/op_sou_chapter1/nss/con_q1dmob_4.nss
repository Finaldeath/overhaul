//check to see if Mara quest is over but this isn't the PC that
//did the quest...
int StartingConditional()
{
    if (GetLocalInt(GetModule(), "Captive_Cook") > 0 && GetLocalInt(GetPCSpeaker(), "Lodar_Job") == 0)
        return TRUE;
    return FALSE;
}
