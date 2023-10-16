// falls asleep to the ground

void main()
{
    SetPlotFlag(OBJECT_SELF, FALSE);
    ClearAllActions();
    effect eSleep = EffectSleep();
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eSleep, OBJECT_SELF);
    SetLocalInt(OBJECT_SELF, "SLEEP", 1);
    SetPlotFlag(OBJECT_SELF, TRUE);
}
