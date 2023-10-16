//Check if a PC has spoken to Jasmeena already.
int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(),"q5a_Know_Jasmeena")==2)
        return TRUE;
    return FALSE;
}
