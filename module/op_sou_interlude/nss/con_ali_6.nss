//Check if PC has heard about it yet.
int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(),"X1_ALIANDPHAERIMM")==0)
        return TRUE;
    return FALSE;
}
