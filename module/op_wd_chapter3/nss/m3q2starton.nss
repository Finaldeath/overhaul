// * brazier starts 'lit'
void main()
{
    if (GetLocalInt(OBJECT_SELF,"NW_L_HEART") == 0)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_AMION",1);
        SetLocalInt(OBJECT_SELF,"NW_L_HEART",1);
        PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
    }
}
