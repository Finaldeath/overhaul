//Return True if the PC has attacked illithid after agreeing to work with the Elder Brain
//con_q2d4brain_1
int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X2_Q2DBrokeIllithidDeal") == 1)
        return TRUE;
    return FALSE;
}
