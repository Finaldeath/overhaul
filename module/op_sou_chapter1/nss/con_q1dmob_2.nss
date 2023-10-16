//check to see if Mara has been freed
int StartingConditional()
{
    if (GetLocalInt(GetModule(), "Captive_Cook") == 3  && GetLocalInt(GetPCSpeaker(), "Lodar_Job") > 0)
        return TRUE;
    return FALSE;
}
