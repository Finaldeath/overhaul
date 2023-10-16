//Check if PC asked already.
int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(),"X1_ALIANDBANE")==0)
        return TRUE;
    return FALSE;
}
