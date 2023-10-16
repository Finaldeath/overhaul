//con_q2aprost_2
//Check the result of the constitution check

int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(), "X2_PROSTRESULT") == 2)
        return TRUE;
    return FALSE;
}
