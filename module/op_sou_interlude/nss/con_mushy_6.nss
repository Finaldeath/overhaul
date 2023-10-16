//Check if a PC has not spoken to Jasmeena already.
int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(),"q5a_Know_Jasmeena")==0)
        return TRUE;
    return FALSE;
}
