int StartingConditional()
{
    if(GetLocalInt(OBJECT_SELF, "nHealed") == 1)
    {
        SetLocalInt(OBJECT_SELF, "nHealed", 2);
        return TRUE;
    }
    return FALSE;
}
