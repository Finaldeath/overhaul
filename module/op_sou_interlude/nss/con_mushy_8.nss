//Check if a PC has asked Mushy to scrounge something.
int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(),"X1_MUSHYSCROUNGE")==1)
        return TRUE;
    return FALSE;
}
