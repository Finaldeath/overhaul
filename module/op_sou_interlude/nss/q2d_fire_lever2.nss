// fire lever on-used: increases delay of all right fireballs by 1.
// when a delay increased above 10 seconds, it initializes back to 1 second.

void main()
{
    ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
    ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);

    object oSource2 = GetNearestObjectByTag("Q2D_FIRE_SOURCE2");
    object oSource4 = GetNearestObjectByTag("Q2D_FIRE_SOURCE4");
    object oSource6 = GetNearestObjectByTag("Q2D_FIRE_SOURCE6");
    object oSource8 = GetNearestObjectByTag("Q2D_FIRE_SOURCE8");

    float fDelay2 = GetLocalFloat(oSource2, "Q2_FIRE_DELAY");
    float fDelay4 = GetLocalFloat(oSource4, "Q2_FIRE_DELAY");
    float fDelay6 = GetLocalFloat(oSource6, "Q2_FIRE_DELAY");
    float fDelay8 = GetLocalFloat(oSource8, "Q2_FIRE_DELAY");

    fDelay2 = fDelay2 + 2.0;
    fDelay4 = fDelay4 + 2.0;
    fDelay6 = fDelay6 + 2.0;
    fDelay8 = fDelay8 + 2.0;

    if(fDelay2 > 12.0) fDelay2 = 2.0;
    if(fDelay4 > 12.0) fDelay4 = 2.0;
    if(fDelay6 > 12.0) fDelay6 = 2.0;
    if(fDelay8 > 12.0) fDelay8 = 2.0;

    SetLocalFloat(oSource2, "Q2_FIRE_DELAY", fDelay2);
    SetLocalFloat(oSource4, "Q2_FIRE_DELAY", fDelay4);
    SetLocalFloat(oSource6, "Q2_FIRE_DELAY", fDelay6);
    SetLocalFloat(oSource8, "Q2_FIRE_DELAY", fDelay8);

    // first - get rid of all the old-delay actions
    SignalEvent(oSource2, EventUserDefined(102));
    SignalEvent(oSource4, EventUserDefined(102));
    SignalEvent(oSource6, EventUserDefined(102));
    SignalEvent(oSource8, EventUserDefined(102));

    // and next - set the new delay
    SignalEvent(oSource2, EventUserDefined(101));
    SignalEvent(oSource4, EventUserDefined(101));
    SignalEvent(oSource6, EventUserDefined(101));
    SignalEvent(oSource8, EventUserDefined(101));


}
