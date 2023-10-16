int StartingConditional()
{
    //int nLocal = d6();
    //SetLocalInt(OBJECT_SELF,"NW_M2Q2_CRAZY_RELMAR", nLocal);

    int nLocal = GetLocalInt(OBJECT_SELF,"NW_M2Q2_CRAZY_RELMAR");

    if(nLocal == 4)
    {
        return TRUE;
    }
    return FALSE;
}

