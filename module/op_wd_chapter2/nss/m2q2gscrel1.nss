int StartingConditional()
{
    int nLocal = d6();
    SetLocalInt(OBJECT_SELF,"NW_M2Q2_CRAZY_RELMAR", nLocal);

    //int nLocal = GetLocalInt(OBJECT_SELF,"NW_M2Q2_CRAZY_RELMAR");

    if(nLocal == 1)
    {
        return TRUE;
    }
    return FALSE;
}
