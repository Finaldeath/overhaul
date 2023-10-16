//con_q2d2pitboss1
//If the PC has sent the slave girl to the pits..
int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X2_Q2DSlaveFight") == 1)
        return TRUE;
    return FALSE;
}
