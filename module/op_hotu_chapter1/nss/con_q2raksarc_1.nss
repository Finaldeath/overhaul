int StartingConditional()
{
    object oArea = GetArea(OBJECT_SELF);
    if (GetLocalInt(oArea, "X2_RakTransformed") == 1)
        return FALSE;

    return TRUE;
}
