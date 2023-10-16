int StartingConditional()
{
    if (GetLocalInt(GetModule(),"X1_TYMOFARRAR_STATUS")==0)
        return TRUE;
    return FALSE;
}
