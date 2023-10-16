//return true if the PC hasn't gotten the thaymart quest yet
int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X1_THAYQUEST") == 0
        || GetLocalInt(GetModule(),"X1_SZARENSPOKE")==0)
        return TRUE;
    return FALSE;
}
