//con_q2delder_1
//Return true if the Illithids have gone hostile to the PC before.
//
int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X2_Q2DIllithidHostile") > 0)
        return TRUE;

    return FALSE;
}
