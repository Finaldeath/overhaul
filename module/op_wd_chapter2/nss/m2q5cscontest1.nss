int StartingConditional()
{
    int l_iResult;

    l_iResult = GetLocalObject(GetModule(),"NW_G_M2Q5ContestPC") == GetPCSpeaker();
    return l_iResult;
    {
        return TRUE;
    }
    return FALSE;
}
