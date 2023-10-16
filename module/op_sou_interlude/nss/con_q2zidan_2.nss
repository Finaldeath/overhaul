//Check if PC has spoken to Zidan abut having the water.
int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(),"X1_Q2ZIDANSPEAK")==2)
        return TRUE;
    return FALSE;
}
