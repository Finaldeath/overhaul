//Check to see if the Henchman's master is speaking with him/her
//return TRUE if he/she is
int StartingConditional()
{

    if (GetMaster(OBJECT_SELF) != GetPCSpeaker())
        return FALSE;
    return TRUE;
}
