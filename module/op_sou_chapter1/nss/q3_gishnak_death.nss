//::///////////////////////////////////////////////////
//:: X0_C2_DTH_LOOT
//:: OnDeath handler.
//:: Leave a lootable corpse that will never decay.
//::
//:: Copyright (c) 2002 Floodgate Entertainment
//:: Created By: Naomi Novik
//:: Created On: 12/07/2002
//::///////////////////////////////////////////////////

#include "nw_i0_generic"
#include "x0_i0_corpses"
#include "q3_inc_plot"

/*
values for Q3_GNOLL_STATUS:

GNOLL_STATUS_INIT =             initial status
GNOLL_STATUS_LEFT =             all gnoll left the area
GNOLL_STATUS_DEAD =             chief is dead
GNOLL_STATUS_SAFE_PASSAGE =     gnollsgave safe passge
GNOLL_STATUS_CONTROL_TRIBE =     player has full control over the tribe

values for Q3_GNOLL_HELP

GNOLL_NOHELP
GNOLL_HELP
*/

void main()
{
    SignalEvent(GetArea(OBJECT_SELF), EventUserDefined(101));

    SetLocalInt(GetModule(), "Q3_GNOLL_STATUS", GNOLL_STATUS_DEAD);
    SignalEvent(GetArea(OBJECT_SELF), EventUserDefined(104)); // make all gnolls hostile
    // * make sure this can happen only once.
    if (GetLocalInt(OBJECT_SELF, "NW_L_DEATHEVENTFIRED") == 10) return;
    SetLocalInt(OBJECT_SELF, "NW_L_DEATHEVENTFIRED",10) ;

    int nClass = GetLevelByClass(CLASS_TYPE_COMMONER);
    int nAlign = GetAlignmentGoodEvil(OBJECT_SELF);
    if(nClass > 0 && (nAlign == ALIGNMENT_GOOD || nAlign == ALIGNMENT_NEUTRAL))
    {
        object oKiller = GetLastKiller();
        AdjustAlignment(oKiller, ALIGNMENT_EVIL, 5);
    }

    SpeakString("NW_I_AM_DEAD", TALKVOLUME_SILENT_TALK);

    //Shout Attack my target, only works with the On Spawn In setup
    SpeakString("NW_ATTACK_MY_TARGET", TALKVOLUME_SILENT_TALK);

    if(GetSpawnInCondition(NW_FLAG_DEATH_EVENT))
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(1007));
    }
    //Make all gnolls hostile
    int nCount = 1;
    object oGnoll = GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_HUMANOID_GOBLINOID, OBJECT_SELF, nCount);
    while (oGnoll != OBJECT_INVALID)
    {
        ChangeToStandardFaction(oGnoll, STANDARD_FACTION_HOSTILE);
        nCount++;
        oGnoll = GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_HUMANOID_GOBLINOID, OBJECT_SELF, nCount);
    }

    // Leave a lootable corpse that will never decay
    KillAndReplaceLootable(OBJECT_SELF, FALSE);
}
