void main()
{
    int bLampOn = GetLocalInt(OBJECT_SELF,"NW_L_LampState");
    if( bLampOn && (GetIsDawn() || GetIsDay()) )
    {
        ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
        DelayCommand(0.4,SetPlaceableIllumination(OBJECT_SELF, FALSE));
        SetLocalInt(OBJECT_SELF,"NW_L_LampState",FALSE);
    }
    else if( !bLampOn && (GetIsDusk() || GetIsNight()) )
    {
        ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
        DelayCommand(0.4,SetPlaceableIllumination(OBJECT_SELF, TRUE));
        SetLocalInt(OBJECT_SELF,"NW_L_LampState",TRUE);
    }
}
