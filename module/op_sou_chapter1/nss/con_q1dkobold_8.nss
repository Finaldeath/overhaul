int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "nTakePCHostage") != 1)
    {

        return TRUE;
    }
    return FALSE;
}
