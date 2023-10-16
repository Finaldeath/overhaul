//con_q2d6golem_1
int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF,"NW_L_TALKLEVEL") == 0)
        return TRUE;
    return FALSE;
}
