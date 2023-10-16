//Check if PC has spoken to him before.
int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(),"X1_Q2ZIDANSPEAK")==1)
        return TRUE;
    return FALSE;
}
