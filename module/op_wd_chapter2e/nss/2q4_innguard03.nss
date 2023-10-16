int StartingConditional()
{
    if ((GetLocalInt(OBJECT_SELF,"counter")!=1) && (GetLocalInt(OBJECT_SELF,"counter")!=3))
    {
        return TRUE;
    }
    return FALSE;
}
