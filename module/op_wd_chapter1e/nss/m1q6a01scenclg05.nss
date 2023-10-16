int StartingConditional()
{
    int  bCondition = GetTag(OBJECT_SELF) == "M1Q6A01Fenthick" &&
                      GetLocalInt(OBJECT_SELF,"NW_L_Scene") == 1;
    if(bCondition)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_Scene",GetLocalInt(OBJECT_SELF,"NW_L_Scene") + 1);
        ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_LEFT);
        ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_RIGHT);
    }
    return bCondition;
}

