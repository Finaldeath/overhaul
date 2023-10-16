#include "help_hench"

//::///////////////////////////////////////////////
//:: Death Script
//:: NW_O0_DEATH.NSS
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script handles the default behavior
    that occurs when a player dies.
*/
//:://////////////////////////////////////////////
//:: Created By: Brent Knowles
//:: Created On: November 6, 2001
//:://////////////////////////////////////////////
 /*
void ClearAllFactionMembers(object oMember, object oPlayer)
{
//    AssignCommand(oMember, SpeakString("here"));
    AdjustReputation(oPlayer, oMember, 100);
    SetLocalInt(oPlayer, "NW_G_Playerhasbeenbad", 10); // * Player bad
    object oClear = GetFirstFactionMember(oMember, FALSE);
    while (GetIsObjectValid(oClear) == TRUE)
    {
        ClearPersonalReputation(oPlayer, oClear);
        oClear = GetNextFactionMember(oMember, FALSE);
    }
}   */
void Raise(object oPlayer)
{
        effect eVisual = EffectVisualEffect(VFX_IMP_RESTORATION);

        effect eBad = GetFirstEffect(oPlayer);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectResurrection(),oPlayer);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectHeal(GetMaxHitPoints(oPlayer)), oPlayer);

        //Search for negative effects
        while(GetIsEffectValid(eBad))
        {
            if (GetEffectType(eBad) == EFFECT_TYPE_ABILITY_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_AC_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_ATTACK_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_IMMUNITY_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SAVING_THROW_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SPELL_RESISTANCE_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SKILL_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_BLINDNESS ||
                GetEffectType(eBad) == EFFECT_TYPE_DEAF ||
                GetEffectType(eBad) == EFFECT_TYPE_PARALYZE ||
                GetEffectType(eBad) == EFFECT_TYPE_NEGATIVELEVEL||
                GetEffectType(eBad) == EFFECT_TYPE_SLOW)
                {
                    //Remove effect if it is negative.
                    RemoveEffect(oPlayer, eBad);
                }
            eBad = GetNextEffect(oPlayer);
        }
        //Fire cast spell at event for the specified target
        SignalEvent(oPlayer, EventSpellCastAt(OBJECT_SELF, SPELL_RESTORATION, FALSE));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisual, oPlayer);
}

void main()
{
    object oPlayer = GetLastPlayerDied();

    // * Handle Spirit of the Wood Death
     string sArea = GetTag(GetArea(oPlayer));
/*
    if (sArea == "MAP_M2Q2F2" && GetDistanceBetweenLocations(GetLocation(GetObjectByTag("M2Q2F2_M2Q2G")), GetLocation(oPlayer)) < 5.0 && GetLocalInt(GetModule(),"NW_M2Q2E_WoodsFreed") == 0)
    {
        int bValid;

        Raise(oPlayer);
        string sDestTag = "WP_M2Q2GtoM2Q2F";
        object oSpawnPoint = GetObjectByTag(sDestTag);
        AssignCommand(oPlayer,JumpToLocation(GetLocation(oSpawnPoint)));
        return;

    }
*/
    // * in last level of the Sourcestone, move the player to the beginning of the area
    // * May 16 2002: or the main area of the Snowglobe (to prevent plot logic problems).
    // * May 21 2002: or Castle Never
    if (sArea == "M4Q1D2" || sArea == "M3Q3C" || sArea == "MAP_M1Q6A")
    {

        //Raise(oPlayer);
        //string sDestTag = "M4QD07_ENTER";
        //object oSpawnPoint = GetObjectByTag(sDestTag);
//        AssignCommand(oPlayer, DelayCommand(1.0, JumpToLocation(GetLocation(oSpawnPoint))));
// * MAY 2002: Just popup the YOU ARE DEAD panel at this point

        DelayCommand(2.5, PopUpDeathGUIPanel(oPlayer, FALSE, FALSE, 0 , " "));
        return;
    }

    // * make friendly to Each of the 3 common factions
    AssignCommand(oPlayer, ClearAllActions());
    // * Note: waiting for Sophia to make SetStandardFactionReptuation to clear all personal reputation
    if (GetStandardFactionReputation(STANDARD_FACTION_COMMONER, oPlayer) <= 10)
    {   SetLocalInt(oPlayer, "NW_G_Playerhasbeenbad", 10); // * Player bad
        SetStandardFactionReputation(STANDARD_FACTION_COMMONER, 80, oPlayer);
    }
    if (GetStandardFactionReputation(STANDARD_FACTION_MERCHANT, oPlayer) <= 10)
    {   SetLocalInt(oPlayer, "NW_G_Playerhasbeenbad", 10); // * Player bad
        SetStandardFactionReputation(STANDARD_FACTION_MERCHANT, 80, oPlayer);
    }
    if (GetStandardFactionReputation(STANDARD_FACTION_DEFENDER, oPlayer) <= 10)
    {   SetLocalInt(oPlayer, "NW_G_Playerhasbeenbad", 10); // * Player bad
        SetStandardFactionReputation(STANDARD_FACTION_DEFENDER, 80, oPlayer);
    }

    // if in the Final Trial at the beginning of Stage 0
    if (GetTag(GetArea(oPlayer)) == "AREA_CITY_GHAA_ACAD_TEST")
    {
        Raise(oPlayer);

        object oWP = GetWaypointByTag("WP_ST_0_TEST_RETURN");
        location lWP = GetLocation(oWP);

        DelayCommand(1.5, AssignCommand(oPlayer, JumpToLocation(lWP)));

        // PC has failed the Final Trial
        AddJournalSingle("JT_GRAD_TEST", 25, oPlayer);
    }

    else
    {
        string sMSG = "Death is permanent in ShadowGuard. Please load your "+
                      "game from a previous save. Auto-saves have been "+
                      "provided for your convenience.";

        DelayCommand(2.5, PopUpDeathGUIPanel(oPlayer, FALSE, FALSE, 0 , sMSG));
    }
}
