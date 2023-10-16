//* brazier starts turned on
void main()
{
        if (GetLocalInt(OBJECT_SELF,"NW_L_ON") == 0)
        {
            PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
            SetLocalInt(OBJECT_SELF,"NW_L_AMION",1);
            SetLocalInt(OBJECT_SELF,"NW_L_ON",1);
        }

}
