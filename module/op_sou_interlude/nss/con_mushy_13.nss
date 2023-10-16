//Check if a PC has spoken to Jasmeena about wine.
int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(),"q5a_Jasmeena_Status")==3)
        return TRUE;
    return FALSE;
}
