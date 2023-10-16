int StartingConditional()
{
    int  bCondition = GetTag(OBJECT_SELF) == "M1Q6A01Aribeth" &&
                      GetLocalInt(OBJECT_SELF,"NW_L_Scene") == 1;
    if(bCondition)
    {
        ActionPlayAnimation(ANIMATION_LOOPING_TALK_FORCEFUL);
    }
    return bCondition;
}
