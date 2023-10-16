// Aghaaz's scout inits dialog.

void main()
{
    object oScout = GetNearestObjectByTag("q4c_aghaaz_scout");
    object oPC = GetLastOpenedBy();
    if(oPC == OBJECT_INVALID)
        oPC = GetLastKiller();
    if(oPC == OBJECT_INVALID)
        oPC = GetFirstPC();

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    AssignCommand(oPC, ClearAllActions(TRUE));

    AssignCommand(oScout, SurrenderToEnemies());

    int i = 1;
    object oCreature = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_FRIEND, oScout, i);
    while(oCreature != OBJECT_INVALID)
    {
        // do not surrender the minogons
        if(GetAppearanceType(oCreature) != APPEARANCE_TYPE_MINOGON)
        {
            AssignCommand(oCreature, ClearAllActions());
            AssignCommand(oCreature, SurrenderToEnemies());
        }
        i++;
        oCreature = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_FRIEND, oScout, i);
    }

    AdjustReputation(oPC, oScout, 100);
    AdjustReputation(oScout, oPC, 100);

    DelayCommand(2.0, AssignCommand(oScout, ActionStartConversation(oPC)));
}
