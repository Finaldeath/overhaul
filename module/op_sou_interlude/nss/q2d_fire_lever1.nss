// fire lever on-used: increases delay of all right fireballs by 1.
// when a delay increased above 10 seconds, it initializes back to 1 second.

void main()
{
    ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
    ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);

    object oSource1 = GetNearestObjectByTag("Q2D_FIRE_SOURCE1");
    object oSource3 = GetNearestObjectByTag("Q2D_FIRE_SOURCE3");
    object oSource5 = GetNearestObjectByTag("Q2D_FIRE_SOURCE5");
    object oSource7 = GetNearestObjectByTag("Q2D_FIRE_SOURCE7");

    float fDelay1 = GetLocalFloat(oSource1, "Q2_FIRE_DELAY");
    float fDelay3 = GetLocalFloat(oSource3, "Q2_FIRE_DELAY");
    float fDelay5 = GetLocalFloat(oSource5, "Q2_FIRE_DELAY");
    float fDelay7 = GetLocalFloat(oSource7, "Q2_FIRE_DELAY");

    fDelay1 = fDelay1 + 2.0;
    fDelay3 = fDelay3 + 2.0;
    fDelay5 = fDelay5 + 2.0;
    fDelay7 = fDelay7 + 2.0;

    if(fDelay1 > 12.0) fDelay1 = 2.0;
    if(fDelay3 > 12.0) fDelay3 = 2.0;
    if(fDelay5 > 12.0) fDelay5 = 2.0;
    if(fDelay7 > 12.0) fDelay7 = 2.0;

    SetLocalFloat(oSource1, "Q2_FIRE_DELAY", fDelay1);
    SetLocalFloat(oSource3, "Q2_FIRE_DELAY", fDelay3);
    SetLocalFloat(oSource5, "Q2_FIRE_DELAY", fDelay5);
    SetLocalFloat(oSource7, "Q2_FIRE_DELAY", fDelay7);

    // first - get rid of all the old-delay actions
    SignalEvent(oSource1, EventUserDefined(102));
    SignalEvent(oSource3, EventUserDefined(102));
    SignalEvent(oSource5, EventUserDefined(102));
    SignalEvent(oSource7, EventUserDefined(102));

    // and next - set the new delay
    SignalEvent(oSource1, EventUserDefined(101));
    SignalEvent(oSource3, EventUserDefined(101));
    SignalEvent(oSource5, EventUserDefined(101));
    SignalEvent(oSource7, EventUserDefined(101));


}
