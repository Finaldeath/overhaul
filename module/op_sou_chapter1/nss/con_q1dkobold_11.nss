//Check to see if the kobolds were intimidated into
//surrender by the hostage..
int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "nPCHostage") == 2)
        return TRUE;
    return FALSE;

}
