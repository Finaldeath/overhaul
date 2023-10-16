//Check to see if the PC is a hostage...
int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "nPCHostage") == 1)
        return TRUE;
    return FALSE;

}
