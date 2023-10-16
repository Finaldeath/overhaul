int StartingConditional()
{
    int nResult = GetLocalInt(GetPCSpeaker(),"Colmarr_Told_Invention");
    if(nResult != 2)
    {
        return TRUE;
    }
    return FALSE;
}
