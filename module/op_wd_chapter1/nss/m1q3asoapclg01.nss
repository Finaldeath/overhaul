int StartingConditional()
{
    SetLocalInt(OBJECT_SELF,"NW_L_Random",Random(10));
    return GetLocalInt(OBJECT_SELF,"NW_L_Random") == 0;
}
