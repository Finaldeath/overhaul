//Check if PC has already asked
int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(),"X1_ALIGIFT")==0)
        return TRUE;
    return FALSE;
}
