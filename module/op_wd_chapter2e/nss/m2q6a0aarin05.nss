int StartingConditional()
{
    int iResult = GetLocalInt(GetPCSpeaker(),"Aribeth_Explained_Orders");
    if (iResult == 1)
    {
        return TRUE;
    }
    return FALSE;
}
