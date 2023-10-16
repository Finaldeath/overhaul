// Have the golems at the main hall resume fighting each other when the player returns to the area.

#include "nw_i0_generic"

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;

    // ignore first time entering
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 0)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);


    // adjust global reputation for the golems factions
    object oGolem1 = GetObjectByTag("q4c_rep1");
    object oGolem2 = GetObjectByTag("q4c_rep2");
    AdjustReputation(oGolem1, oGolem2, -100);
    AdjustReputation(oGolem2, oGolem1, -100);
    object oGolem = GetFirstObjectInArea(GetArea(OBJECT_SELF));
    string sTag;
    while(oGolem != OBJECT_INVALID)
    {
        if(!GetIsInCombat(oGolem))
        {
            sTag = GetTag(oGolem);
            if(GetStringLeft(sTag, 12) == "q4c_Cutscene")
            {
                AssignCommand(oGolem, DetermineCombatRound());
            }
        }
        oGolem = GetNextObjectInArea(GetArea(OBJECT_SELF));
    }
}
