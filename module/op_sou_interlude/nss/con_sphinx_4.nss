//Has Sphinx been spoken to?
int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(),"X1_SPHINXSPOKE")==10)
        return TRUE;
    return FALSE;
}
