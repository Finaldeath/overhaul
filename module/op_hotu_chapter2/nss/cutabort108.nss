//::///////////////////////////////////////////////
//:: Name cutabort108
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Abort of Maeviir Betrayal Cutscene
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Sept 11/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void RemoveCutsceneEffects(object oHench);

void main()
{
    object oPC = GetLastPCToCancelCutscene();
    if(GetIsPossessedFamiliar(oPC))
        oPC = GetMaster(oPC);
    SetLocalInt(GetModule(), "Cutscene108Aborted", 1);
    BlackScreen(oPC);

    //Get rid of any cutscene effects on the henchmen
    int i = 1;
    effect eVis;
    object oHench = GetHenchman(oPC, i);
    while(oHench != OBJECT_INVALID)
    {
        RemoveCutsceneEffects(oHench);
        i++;
        oHench = GetHenchman(oPC, i);
    }

    DelayCommand(1.0, FadeFromBlack(oPC, FADE_SPEED_FASTEST));

    // Cutscene actors and objects.
    object oMatron = GetObjectByTag("q2amaematron");
    object oSeer = GetObjectByTag("q2aseer");
    object oTebomir = GetObjectByTag("q2amaecapt");
    object oGuard1 = GetObjectByTag("cut108_guard1");
    object oGuard2 = GetObjectByTag("cut108_guard2");
    object oGuard3 = GetObjectByTag("cut108_guard3");
    object oGuard4 = GetObjectByTag("cut108_guard4");
    object oGuard5 = GetObjectByTag("cut108_guard5");
    object oGuard6 = GetObjectByTag("cut108_guard6");
    object oGuard7 = GetObjectByTag("cut108_guard7");
    object oGuard8 = GetObjectByTag("cut108_guard8");
    object oGuard9 = GetObjectByTag("cut108_guard9");
    object oGuard10 = GetObjectByTag("cut108_guard10");

    object oRebel1 = GetObjectByTag("cut108_reb1");
    object oRebel2 = GetObjectByTag("cut108_reb2");
    object oRebel3 = GetObjectByTag("cut108_reb3");
    object oRebel4 = GetObjectByTag("cut108_reb4");
    object oRebel5 = GetObjectByTag("cut108_reb5");

    object oDoor1 = GetObjectByTag("cut108_door1");
    object oDoor2 = GetObjectByTag("cut108_door2");
    object oDoor3 = GetObjectByTag("cut108_door3");
    object oDoor4 = GetObjectByTag("cut108_door4");

    object oPC1 = GetWaypointByTag("cut108wp_copy1");
    location lReb1 = GetLocation(GetWaypointByTag("cut108_rebguard1"));
    location lReb2 = GetLocation(GetWaypointByTag("cut108_rebguard2"));
    location lReb3 = GetLocation(GetWaypointByTag("cut108_rebguard3"));
    location lReb4 = GetLocation(GetWaypointByTag("cut108_rebguard4"));
    location lReb5 = GetLocation(GetWaypointByTag("cut108_rebguard5"));
    location lGuard1 = GetLocation(GetWaypointByTag("cut108wp_guard1"));
    location lGuard2 = GetLocation(GetWaypointByTag("cut108wp_guard2"));
    location lGuard3 = GetLocation(GetWaypointByTag("cut108wp_guard3"));
    location lGuard4 = GetLocation(GetWaypointByTag("cut108wp_guard4"));
    location lGuard7 = GetLocation(GetWaypointByTag("cut108wp_guard7"));
    location lGuard8 = GetLocation(GetWaypointByTag("cut108wp_guard8"));
    location lGuard9 = GetLocation(GetWaypointByTag("cut108wp_guard9"));
    location lGuard10 = GetLocation(GetWaypointByTag("cut108wp_guard10"));
    location lSeer1 = GetLocation(GetWaypointByTag("cut108wp_seer1"));
    location lMatron1 = GetLocation(GetWaypointByTag("cut108wp_matron1"));

    AssignCommand(oRebel1, ActionJumpToLocation(lReb1));
    AssignCommand(oRebel2, ActionJumpToLocation(lReb2));
    AssignCommand(oRebel3, ActionJumpToLocation(lReb3));
    AssignCommand(oRebel4, ActionJumpToLocation(lReb4));
    AssignCommand(oRebel5, ActionJumpToLocation(lReb5));
    AssignCommand(oSeer, JumpToLocation(lSeer1));
    AssignCommand(oMatron, JumpToLocation(lMatron1));

    AssignCommand(oGuard1, ActionJumpToLocation(lGuard1));
    AssignCommand(oGuard2, ActionJumpToLocation(lGuard2));
    AssignCommand(oGuard3, ActionJumpToLocation(lGuard3));
    AssignCommand(oGuard4, ActionJumpToLocation(lGuard4));
    AssignCommand(oGuard7, ActionJumpToLocation(lGuard7));
    AssignCommand(oGuard8, ActionJumpToLocation(lGuard8));
    AssignCommand(oGuard9, ActionJumpToLocation(lGuard9));
    AssignCommand(oGuard10, ActionJumpToLocation(lGuard10));

    AssignCommand(oPC, JumpToObject(oPC1));


    ChangeToStandardFaction(oMatron, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oTebomir, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oGuard1, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oGuard2, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oGuard3, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oGuard4, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oGuard5, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oGuard6, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oGuard7, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oGuard8, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oGuard9, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oGuard10, STANDARD_FACTION_HOSTILE);

    AssignCommand(oRebel1, DetermineCombatRound());
    AssignCommand(oRebel2, DetermineCombatRound());
    AssignCommand(oRebel3, DetermineCombatRound());
    AssignCommand(oRebel4, DetermineCombatRound());
    AssignCommand(oRebel5, DetermineCombatRound());
    AssignCommand(oSeer, DetermineCombatRound());

    AssignCommand(oDoor1, ActionCloseDoor(oDoor1));
    AssignCommand(oDoor2, ActionCloseDoor(oDoor2));
    AssignCommand(oDoor3, ActionCloseDoor(oDoor3));
    AssignCommand(oDoor4, ActionCloseDoor(oDoor4));
    SetLocked(oDoor1, TRUE);
    SetLocked(oDoor2, TRUE);
    SetLocked(oDoor3, TRUE);
    SetLocked(oDoor4, TRUE);
}

void RemoveCutsceneEffects(object oHench)
{
    effect eEffect = GetFirstEffect(oHench);
    while (GetIsEffectValid(eEffect) == TRUE)
    {
        //if (GetEffectType(eEffect) == EFFECT_TYPE_INVISIBILITY) *THIS DOES NOT GET CUTSCENE INVIS
            RemoveEffect(oHench, eEffect);

        eEffect = GetNextEffect(oHench);
    }
}
