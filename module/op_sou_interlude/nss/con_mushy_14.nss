//Check if a PC has tried to persuade Mushy already.
int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(),"q5a_notojasmeena")==0)
        return TRUE;
    return FALSE;
}
