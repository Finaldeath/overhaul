//Has Sphinx been asked for better reward?
int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(),"X1_SPHINXREWARD")==0)
        return TRUE;
    return FALSE;
}
