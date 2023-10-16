//check to see if Mara quest is not over yet
int StartingConditional()
{
    if (GetLocalInt(GetModule(), "Captive_Cook") == 0 && GetPCSpeaker() != OBJECT_INVALID)
        return TRUE;
    return FALSE;
}
