void PickBerries()
{
    int bInConv = IsInConversation(OBJECT_SELF);
    if (bInConv == FALSE)
    {
        //Face the nettle
        object oNettle = GetObjectByTag("velna_fern2");
        location lNettle = GetLocation(oNettle);
        vector vNettle = GetPositionFromLocation(lNettle);
        SetFacingPoint(vNettle);

        //Play the berry picking animation.
        PlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 600.0);

        //Resignal the event when the animation runs out.
        DelayCommand(598.0, SignalEvent(OBJECT_SELF, EventUserDefined(8010)));
    }
}

void main()
{
    DelayCommand(2.0, PickBerries());
}
