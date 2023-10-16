int StartingConditional()
{
    if (GetLocalInt(GetModule(), "DurnanSpoke") > 3)
        return TRUE;
    return FALSE;

    //if (GetLocalInt(GetPCSpeaker(), "nBeenToDungeon") == 1)
    //    return TRUE;
    //return FALSE;
}
