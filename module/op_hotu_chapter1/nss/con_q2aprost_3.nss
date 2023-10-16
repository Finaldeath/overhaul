//con_q2aprost_3
//Check the result of the constitution check

int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(), "X2_PROSTRESULT") == 3)
        return TRUE;
    return FALSE;
}
