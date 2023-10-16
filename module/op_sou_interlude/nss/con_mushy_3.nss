//Check if Mushy has scrounged item for PC already.
int StartingConditional()
{
    if (GetLocalInt(GetModule(),"X1_MUSHYSCROUNGED")==0)
        return TRUE;
    return FALSE;
}
