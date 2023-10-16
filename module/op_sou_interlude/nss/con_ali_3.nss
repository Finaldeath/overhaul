//Check if PC has heard about it yet.
int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(),"X1_ALIANDPHAERIMM")==10)
        return TRUE;
    return FALSE;
}
