//con_q2d6golem_2
int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF,"NW_L_TALKLEVEL") == 1)
        return TRUE;
    return FALSE;
}
