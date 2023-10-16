void main()
{
    int nActive = GetLocalInt (OBJECT_SELF,"X2_L_PLC_ACTIVATED_STATE");
    PlaySound("as_sw_pulybucket");
    // * Play Appropriate Animation
    if (!nActive)
    {
      ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
      DelayCommand(1.5, ActionStartConversation(GetLastUsedBy()));

    }
    else
    {
      ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
    }
    // * Store New State
    SetLocalInt(OBJECT_SELF,"X2_L_PLC_ACTIVATED_STATE",!nActive);
}
