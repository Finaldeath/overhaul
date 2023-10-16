int StartingConditional()
{
    int bCondition = GetLocalInt(OBJECT_SELF,"NW_L_Battle") == 0;
    if(bCondition)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_Battle",1);
    }
    return bCondition;
}
