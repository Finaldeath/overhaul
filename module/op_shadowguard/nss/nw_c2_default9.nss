//::///////////////////////////////////////////////
//:: Default: On Spawn In
//:: NW_C2_DEFAULT9
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Determines the course of action to be taken
    after having just been spawned in
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 25, 2001
//:://////////////////////////////////////////////
#include "NW_O2_CONINCLUDE"
#include "NW_I0_GENERIC"
#include "help_hench"
#include "help_general"

void main()
{
// OPTIONAL BEHAVIORS (Comment In or Out to Activate ) ****************************************************************************
     //SetSpawnInCondition(NW_FLAG_SPECIAL_CONVERSATION);
     //SetSpawnInCondition(NW_FLAG_SPECIAL_COMBAT_CONVERSATION);
                // This causes the creature to say a special greeting in their conversation file
                // upon Perceiving the player. Attach the [NW_D2_GenCheck.nss] script to the desired
                // greeting in order to designate it. As the creature is actually saying this to
                // himself, don't attach any player responses to the greeting.

     SetSpawnInCondition(NW_FLAG_SHOUT_ATTACK_MY_TARGET);
                // This will set the listening pattern on the NPC to attack when allies call
     //SetSpawnInCondition(NW_FLAG_STEALTH);
                // If the NPC has stealth and they are a rogue go into stealth mode
     //SetSpawnInCondition(NW_FLAG_SEARCH);
                // If the NPC has Search go into Search Mode
     //SetSpawnInCondition(NW_FLAG_SET_WARNINGS);
                // This will set the NPC to give a warning to non-enemies before attacking

     //SetSpawnInCondition(NW_FLAG_SLEEP);
                //Creatures that spawn in during the night will be asleep.
     //SetSpawnInCondition(NW_FLAG_DAY_NIGHT_POSTING);
     //SetSpawnInCondition(NW_FLAG_APPEAR_SPAWN_IN_ANIMATION);
     //SetSpawnInCondition(NW_FLAG_IMMOBILE_AMBIENT_ANIMATIONS);
     //SetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS);
                //This will play Ambient Animations until the NPC sees an enemy or is cleared.
                //NOTE that these animations will play automatically for Encounter Creatures.

    // NOTE: ONLY ONE OF THE FOLOOWING ESCAPE COMMANDS SHOULD EVER BE ACTIVATED AT ANY ONE TIME.
    //SetSpawnInCondition(NW_FLAG_ESCAPE_RETURN);    // OPTIONAL BEHAVIOR (Flee to a way point and return a short time later.)
    //SetSpawnInCondition(NW_FLAG_ESCAPE_LEAVE);     // OPTIONAL BEHAVIOR (Flee to a way point and do not return.)
    //SetSpawnInCondition(NW_FLAG_TELEPORT_LEAVE);   // OPTIONAL BEHAVIOR (Teleport to safety and do not return.)
    //SetSpawnInCondition(NW_FLAG_TELEPORT_RETURN);  // OPTIONAL BEHAVIOR (Teleport to safety and return a short time later.)

// CUSTOM USER DEFINED EVENTS
/*
    The following settings will allow the user to fire one of the blank user defined events in the NW_D2_DefaultD.  Like the
    On Spawn In script this script is meant to be customized by the end user to allow for unique behaviors.  The user defined
    events user 1000 - 1010
*/
    SetSpawnInCondition(NW_FLAG_HEARTBEAT_EVENT);        //OPTIONAL BEHAVIOR - Fire User Defined Event 1001
    SetSpawnInCondition(NW_FLAG_PERCIEVE_EVENT);         //OPTIONAL BEHAVIOR - Fire User Defined Event 1002
    SetSpawnInCondition(NW_FLAG_ATTACK_EVENT);           //OPTIONAL BEHAVIOR - Fire User Defined Event 1005
    SetSpawnInCondition(NW_FLAG_DAMAGED_EVENT);          //OPTIONAL BEHAVIOR - Fire User Defined Event 1006
    SetSpawnInCondition(NW_FLAG_DISTURBED_EVENT);        //OPTIONAL BEHAVIOR - Fire User Defined Event 1008
    SetSpawnInCondition(NW_FLAG_END_COMBAT_ROUND_EVENT); //OPTIONAL BEHAVIOR - Fire User Defined Event 1003
    SetSpawnInCondition(NW_FLAG_ON_DIALOGUE_EVENT);      //OPTIONAL BEHAVIOR - Fire User Defined Event 1004
    SetSpawnInCondition(NW_FLAG_DEATH_EVENT);            //OPTIONAL BEHAVIOR - Fire User Defined Event 1007
    SetSpawnInCondition(NW_FLAG_SPELL_CAST_AT_EVENT);

// Script for randomly setting Commoner behavior

    string sTag = GetTag(OBJECT_SELF);

    if (sTag == "CT_COMM_SH_CITI"
        || sTag == "CT_COMM_NT_GHCM")
            DelayCommand(1.0, RandomWalk(OBJECT_SELF));

// Script for the Crimson Prophet
    if (GetTag(OBJECT_SELF) == "CT_UNIQ_NT_CRIM")
    {
        SetPlotFlag(OBJECT_SELF, FALSE);

        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_PROTECTION_GOOD_MAJOR), OBJECT_SELF);

        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_PROTECTION_EVIL_MAJOR), OBJECT_SELF);

        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_LIGHT_RED_10), OBJECT_SELF);

        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE), OBJECT_SELF);

        DelayCommand(0.5, SetPlotFlag(OBJECT_SELF, TRUE));
    }

// Script for creatures that are statues

    if (GetStringLeft(GetName(OBJECT_SELF), 6) == "Statue")
    {
        MakeStatue(OBJECT_SELF);
    }

// Script for creatures that are ghosts

    if (GetStringLeft(GetTag(OBJECT_SELF), 7) == "CT_GHOS")
    {
        int nOldPlotFlag = GetPlotFlag(OBJECT_SELF);

        SetPlotFlag(OBJECT_SELF, FALSE);

        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE), OBJECT_SELF);

        DelayCommand(0.5, SetPlotFlag(OBJECT_SELF, nOldPlotFlag));
    }

// Script for Emperor Rakha

    if (GetTag(OBJECT_SELF) == "CT_UNIQ_NT_RAKH")
    {
        int nOldPlotFlag = GetPlotFlag(OBJECT_SELF);

        SetPlotFlag(OBJECT_SELF, FALSE);

        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_IMP_PULSE_HOLY), OBJECT_SELF);

        DelayCommand(0.5, SetPlotFlag(OBJECT_SELF, nOldPlotFlag));
    }

// Scripts for creatures that are "Dead"

    if (GetStringLeft(GetTag(OBJECT_SELF), 4) == "DEAD")
    {
        SetIsDestroyable(FALSE, FALSE, FALSE);

        SetPlotFlag(OBJECT_SELF, FALSE);

        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), OBJECT_SELF);
    }

// Script for sitting characters

    object oChair = GetNearestObjectByTag("PT_" + GetTag(OBJECT_SELF));

    if (GetTag(OBJECT_SELF) != "CT_UNIQ_PH_MALT")
    {
        if (GetIsObjectValid(oChair))
        {
            if (GetArea(OBJECT_SELF) == GetArea(oChair))
            {
                if (GetDistanceBetween(OBJECT_SELF, oChair) <= 10.0)
                {
                    AssignCommand(OBJECT_SELF, ActionSit(oChair));
                }
            }
        }
    }

// Script for Fallen Ones in Chambers of Rakha
    if (GetTag(OBJECT_SELF) == "CT_COMM_HS_DARK" || GetTag(OBJECT_SELF) == "CT_COMM_HS_DASP")
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_IMPLOSION), OBJECT_SELF);
    }

// Set a variable on object to mark its starting location

    SetLocalLocation(OBJECT_SELF, "N_START_LOCATION", GetLocation(OBJECT_SELF));

// DEFAULT GENERIC BEHAVIOR (DO NOT TOUCH) *****************************************************************************************
    SetListeningPatterns();    // Goes through and sets up which shouts the NPC will listen to.
    WalkWayPoints();           // Optional Parameter: void WalkWayPoints(int nRun = FALSE, float fPause = 1.0)
                               // 1. Looks to see if any Way Points in the module have the tag "WP_" + NPC TAG + "_0X", if so walk them
                               // 2. If the tag of the Way Point is "POST_" + NPC TAG the creature will return this way point after
                               //    combat.
    // GenerateNPCTreasure();     //* Use this to create a small amount of treasure on the creature

    if((GetLootable(OBJECT_SELF) == TRUE)
    && ((GetTag(OBJECT_SELF) != "CT_COMM_NT_MRBM")
    || (GetTag(OBJECT_SELF) != "CT_UNIQ_NT_MYLO")))
    {
        SetIsDestroyable(FALSE, FALSE, TRUE);
        SetLootable(OBJECT_SELF, TRUE);
    }
}


