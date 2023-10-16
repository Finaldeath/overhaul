//con_q2dslaveld_1
int StartingConditional()
{
    object oArea = GetArea(OBJECT_SELF);
    if (GetLocalInt(oArea, "nRevolt") == 1)
        return TRUE;
    return FALSE;
}
