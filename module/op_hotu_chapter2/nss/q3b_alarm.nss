// Sonic trap alarm in the cult temple:
// - Calls more cultists every round.
// - Alerts Armand for intruders (buff himself).

void BringMonstersFromArea(object oArea)
{
    object oMonster = GetFirstObjectInArea(oArea);
    float fDelay = GetLocalFloat(OBJECT_SELF, "DELAY");

    while(oMonster != OBJECT_INVALID)
    {
        if(GetTag(oMonster) == "q3_CultKnight" || GetTag(oMonster) == "NW_SKELDEVOUR")
        {
            SetAILevel(oMonster, AI_LEVEL_HIGH);
            SignalEvent(oMonster, EventUserDefined(101));
        }
        oMonster = GetNextObjectInArea(oArea);
    }
}

void main()
{
    object oLevel1 = GetArea(OBJECT_SELF);
    object oLevel2 = GetObjectByTag("CultTempleLevel2");
    object oPC = GetEnteringObject();
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);
    SetLocalInt(GetModule(), "q3_Alarm", 1); // Armand uses this var to buff himself

    object oGuard = GetNearestObjectByTag("q3_CultGuard");
    AdjustReputation(oGuard, oPC, -100);
    AdjustReputation(oPC, oGuard, -100);
    AssignCommand(oGuard, ActionMoveToObject(oPC, TRUE, 7.0));

    BringMonstersFromArea(oLevel1);
    BringMonstersFromArea(oLevel2);


}
