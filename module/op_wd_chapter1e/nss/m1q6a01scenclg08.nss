int StartingConditional()
{
    int  bCondition = GetTag(OBJECT_SELF) == "M1Q6A01Desther" &&
                      GetLocalInt(OBJECT_SELF,"NW_L_Scene") == 3;
    if(bCondition)
    {
        ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING);
    }
    return bCondition;
}
