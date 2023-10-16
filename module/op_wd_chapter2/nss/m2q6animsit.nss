void main()
{
    if (GetLocalInt(OBJECT_SELF,"NW_L_Sleeping") == 0)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_Sleeping",10);
        ActionPlayAnimation(ANIMATION_LOOPING_SIT_CROSS,0.5,5000.0);
    }
}
