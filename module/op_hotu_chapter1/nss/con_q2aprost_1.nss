//con_q2aprost_1
//Check the result of the constitution check

int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(), "X2_PROSTRESULT") == 1)
        return TRUE;
    return FALSE;
}
