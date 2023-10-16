//Check if a PC has spoken to Mushy already.
int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(),"q5a_Know_Musharak")==2)
        return TRUE;
    return FALSE;
}
