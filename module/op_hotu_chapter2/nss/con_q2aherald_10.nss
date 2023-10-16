//con_q2a1herald_1
int StartingConditional()
{
    if(GetLocalInt(GetModule(), "Q2A1_Herald_Conversation") == 0)
        return TRUE;
    return FALSE;
}
