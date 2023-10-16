int StartingConditional()
{
    int  bCondition = GetTag(OBJECT_SELF) == "M1Q6A01Desther" &&
                      GetLocalInt(OBJECT_SELF,"NW_L_Scene") == 0;
    if(bCondition)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_Scene",GetLocalInt(OBJECT_SELF,"NW_L_Scene") + 1);
        ActionPlayAnimation(ANIMATION_LOOPING_LOOK_FAR);
    }
    return bCondition;
}

