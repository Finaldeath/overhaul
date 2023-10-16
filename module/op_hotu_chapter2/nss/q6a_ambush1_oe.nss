// Player enters ambush 1 trigger:
// Create all enemies.

#include "nw_i0_generic"

void SpawnDrow(string sBP, object oWP);

void RemoveEffects(object oDrow)
{
    effect eEff = GetFirstEffect(oDrow);
    while(GetIsEffectValid(eEff))
    {
        RemoveEffect(oDrow, eEff);
        eEff = GetNextEffect(oDrow);
    }
}

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    SetLocalInt(GetArea(OBJECT_SELF), "AMBUSH_STARTED", 1);

    int i = 1;
    object oSabalWP = GetNearestObjectByTag("q6a_wp_amb_sabal_sp");
    object oClericWP = GetNearestObjectByTag("q6a_wp_amb_cleric_sp");
    object oRogue1WP = GetNearestObjectByTag("q6a_wp_amb_rogue_sp", oPC, 1);
    object oRogue2WP = GetNearestObjectByTag("q6a_wp_amb_rogue_sp", oPC, 2);
    object oWarriorWP = GetNearestObjectByTag("q6a_wp_amb_warrior_sp");

    SpawnDrow("q6_sabal2", oSabalWP);

    object oDrow = GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_ELF, oPC, i);
    string sTag;
    float fDistance;
    float fDelay;
    while(oDrow != OBJECT_INVALID)
    {
        fDistance = GetDistanceBetween(oDrow, oPC);
        if(fDistance > 40.0)
            return;
        sTag = GetTag(oDrow);
        if(sTag == "q6_RSRogue" || sTag == "q6_DrowWarrior" || sTag == "q6_RSWarrior" || sTag == "q6_RSCleric")
        {
            ChangeToStandardFaction(oDrow, STANDARD_FACTION_HOSTILE);
            DelayCommand(fDelay, RemoveEffects(oDrow));
            DelayCommand(fDelay, SignalEvent(oDrow, EventUserDefined(102)));
            fDelay += 0.3;
        }
        i++;
        oDrow = GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_ELF, oPC, i);
    }

    /*
    DelayCommand(0.5, SpawnDrow("q6_rscleric", oClericWP));
    DelayCommand(0.5, SpawnDrow("q6_rsrogue", oRogue1WP));
    DelayCommand(1.0, SpawnDrow("q6_rsrogue", oRogue2WP));
    DelayCommand(1.0, SpawnDrow("q6_rswarrior", oWarriorWP));

    float fDelay = 1.5;
    object oDrowWP = GetNearestObjectByTag("q6a_wp_amb_drow_sp", oPC, i);
    while(oDrowWP != OBJECT_INVALID)
    {
        DelayCommand(fDelay, SpawnDrow("q6_drowwarrior", oDrowWP));
        fDelay += 0.3;
        i++;
        oDrowWP = GetNearestObjectByTag("q6a_wp_amb_drow_sp", oPC, i);
    }

    i = 1;
    oDrowWP = GetNearestObjectByTag("q6a_wp_amb_ground_sp", oPC, i);
    while(oDrowWP != OBJECT_INVALID)
    {
        DelayCommand(fDelay, SpawnDrow("q6_drowwarrior", oDrowWP));
        fDelay += 0.3;
        i++;
        oDrowWP = GetNearestObjectByTag("q6a_wp_amb_ground_sp", oPC, i);
    } */


}

void SpawnDrow(string sBP, object oWP)
{
    object oPC = GetEnteringObject();
    object oDrow = CreateObject(OBJECT_TYPE_CREATURE, sBP, GetLocation(oWP));
    ChangeToStandardFaction(oDrow, STANDARD_FACTION_HOSTILE);
    if(GetTag(oWP) == "q6a_wp_amb_ground_sp")
        AssignCommand(oDrow, ActionMoveToObject(oPC, TRUE, 10.0));
    SignalEvent(oDrow, EventUserDefined(102));
}
