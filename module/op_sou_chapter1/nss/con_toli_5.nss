//Check if Becka is dead.
int StartingConditional()
{
    if (GetLocalInt(GetModule(),"X1_BECKADIED")==10||GetLocalInt(GetModule(),"X1_BECKADIED")==20)
        return TRUE;
    return FALSE;
}
