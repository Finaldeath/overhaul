
//Check to see if the Henchman already has a master.
//Return FALSE if he does

int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "nHaveMaster") == 1)
        return FALSE;
    return TRUE;
}
