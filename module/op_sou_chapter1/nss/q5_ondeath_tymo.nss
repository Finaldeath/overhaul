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

void main()
{

    // * make sure this can happen only once.
    if (GetLocalInt(OBJECT_SELF, "NW_L_DEATHEVENTFIRED") == 10) return;
    SetLocalInt(OBJECT_SELF, "NW_L_DEATHEVENTFIRED",10) ;
    object oPC = GetLastHostileActor();
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

    // Leave a lootable corpse that will never decay
    //KillAndReplaceLootable(OBJECT_SELF, FALSE);

    //Make some special chests for Tymo's death
    location lSpawn1 = GetLocation(GetWaypointByTag("wp_tymodeath_chest1"));
    location lSpawn2 = GetLocation(GetWaypointByTag("wp_tymodeath_chest2"));
    location lSpawn3 = GetLocation(GetWaypointByTag("wp_tymodeath_chest3"));

    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_BREACH), lSpawn1);
    DelayCommand(1.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DEATH_WARD), lSpawn1));
    CreateObject(OBJECT_TYPE_PLACEABLE, "q5tymo_chest3", lSpawn1);

    DelayCommand(0.4, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_BREACH), lSpawn2));
    DelayCommand(1.4, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DEATH_WARD), lSpawn2));

    CreateObject(OBJECT_TYPE_PLACEABLE, "q5tymo_chest1", lSpawn2);

    DelayCommand(0.2, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_BREACH), lSpawn3));
    DelayCommand(1.2, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DEATH_WARD), lSpawn3));

    CreateObject(OBJECT_TYPE_PLACEABLE, "q5tymo_chest2", lSpawn3);

    if (GetLocalInt(GetModule(), "X1_JNAHPLOT") == 10)
    {
        AddJournalQuestEntry("q5jnahsrequest", 20, oPC);
    }
    if (GetLocalInt(GetModule(), "X1_TYMOFARRAR_STATUS") == 2)
    {
        AddJournalQuestEntry("q3tymofarrarsrevenge", 40, oPC);
    }
    SetLocalInt(GetModule(), "X1_TYMOFARRAR_STATUS", 3);
}
