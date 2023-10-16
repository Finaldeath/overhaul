//Check if a PC has tried to intimidate Mushy for Jas already.
int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(),"q5a_notointjasmeena")==0)
        return TRUE;
    return FALSE;
}
