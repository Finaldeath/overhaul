//Check if the rat already stole the diamond.
int StartingConditional()
{
    if (GetLocalInt(GetModule(),"X1_THIEVINGRAT")==0)
        return TRUE;
    return FALSE;
}
