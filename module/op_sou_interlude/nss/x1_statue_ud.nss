// Statue user-defined event: turn to stone if a player is nearby

void main()
{
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == EVENT_HEARTBEAT)
    {
        object oPC = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE);
        if(GetIsPC(oPC))
        {
            float fDistance = GetDistanceBetween(OBJECT_SELF, oPC);
            if(fDistance > 40.0)
                return;
            int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
            if(nDoOnce == 1)
                return;
            SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);
            effect eStone = EffectPetrify();
            ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY3);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eStone, OBJECT_SELF);
        }
    }
}
