// Mephits on-combat-round-end or attacked: move away from pc if more than 3m away
void main()
{
    int nEvent = GetUserDefinedEventNumber();

    /*if(nEvent == EVENT_END_COMBAT_ROUND)
    {
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        if(oPC == OBJECT_INVALID)
            return;
        float fDistance = GetDistanceBetween(OBJECT_SELF, oPC);
        if(fDistance < 3.0)
            return;
        ClearAllActions();
        ActionMoveAwayFromObject(oPC, TRUE);
    }
    else if(nEvent == EVENT_ATTACKED)
    {
        int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
        if(nDoOnce == 1)
            return;
        SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        if(oPC == OBJECT_INVALID)
            return;
        ClearAllActions();
        ActionMoveAwayFromObject(oPC, TRUE);

    }*/
}
