//Has Sphinx asked riddles?
int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(),"X1_SPHINXRIDDLES")==0)
        return TRUE;
    return FALSE;
}
