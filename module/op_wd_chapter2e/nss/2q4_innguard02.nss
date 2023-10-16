int StartingConditional()
{
    if ((GetLocalInt(OBJECT_SELF,"counter")!=3) && (GetLocalInt(OBJECT_SELF,"counter")!=2))
    {
        return TRUE;
    }
    return FALSE;
}
