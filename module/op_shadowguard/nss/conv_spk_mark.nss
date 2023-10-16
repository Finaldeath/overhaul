int StartingConditional()
{
    string sTag = "HENCH_MARK";

    object o = GetNearestObjectByTag(sTag);

    if (o == OBJECT_INVALID || GetArea(OBJECT_SELF) != GetArea(o) || GetDistanceBetween(o, OBJECT_SELF) > 10.0)
        return FALSE;

    return TRUE;
}
