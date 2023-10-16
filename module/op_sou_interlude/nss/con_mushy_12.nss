//Check if a PC has tried to intimidate Mushy already.
int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(),"q5a_nointimidate")==0)
        return TRUE;
    return FALSE;
}
