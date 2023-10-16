//::///////////////////////////////////////////////
//:: Name bat2_mindflayer
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
 //Spawn in some Illithid and Umber Hulks - show via a cutscene
    //The Matron will have Illithid and Umber Hulks unless X2_Q2DOvermind > 0
   //bat2wp_mindflayerspawn1-5
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 9/03
//:://////////////////////////////////////////////

#include "x2_inc_cutscene"
#include "nw_i0_generic"
#include "x2_inc_globals"

int nCutsceneNumber = 106;

void StartCutscene(object oPC, location lSpawn);
void CreateMindFlayerGroup(object oTarget, location lSpawn);
void CreateFirstMindFlayerGroup(object oTarget, location lSpawn);
void CreateFirstMindFlayer(string szIllithid, object oTarget, location lSpawn);
void CreateMindFlayer(string szIllithid, object oTarget, location lSpawn);
void RockEffects(location lSpawn1);
void Battle2SpawnNext();

void main()
{

    object oSeer = GetObjectByTag("q2aseer");
    //Get the PC object (stored on the battle herald)
    object oHerald = GetObjectByTag("q2arebimloth");
    object oPC = GetLocalObject(oHerald, "oLeader");
    //string szIllithid = "q2a_bat2_mf1";
    //string szUmberHulk = "q2a_bat2_mf2";
    string szSpawn = "bat2wp_mindflayerspawn";
    int nRandom = Random(5) + 1;
    object oSpawn = GetWaypointByTag(szSpawn + IntToString(nRandom));
    location lSpawn1 = GetLocation(oSpawn);

    //Create an initial wave of mindflayer groups - 2 at 2 different spawn points
    //First one is seen in the cutscene
    DelayCommand(2.0, CreateFirstMindFlayerGroup(oSeer, lSpawn1));
    StartCutscene(oPC, lSpawn1);

    nRandom = nRandom + 1;
    if (nRandom > 5)
        nRandom = 1;

    oSpawn = GetWaypointByTag(szSpawn + IntToString(nRandom));
    location lSpawn2 = GetLocation(oSpawn);
    DelayCommand(14.0, RockEffects(lSpawn2));
    DelayCommand(15.0, CreateMindFlayerGroup(oSeer, lSpawn2));

}

void StartCutscene(object oPC, location lSpawn)
{
    DelayCommand(2.0, RockEffects(lSpawn));
    //Set the cutscene as active
    CutSetActiveCutscene(nCutsceneNumber, CUT_DELAY_TYPE_CONSTANT);
    //Clear the PCs actions
    AssignCommand(oPC, ClearAllActions(TRUE));
    //Fade PC to black
    BlackScreen(oPC);

    CutSetActiveCutsceneForObject(oPC, nCutsceneNumber, TRUE);
    CutDisableAbort(nCutsceneNumber);
    CutSetCutsceneMode(0.25, oPC, TRUE, TRUE, TRUE, TRUE); // pc invis - keep and freeze associates

    //Store PCs location for return at end of cutscene
    CutSetLocation(0.30, oPC, FALSE);

    CutFadeFromBlack(1.0, oPC, FADE_SPEED_FAST, FALSE);

    CutJumpToLocation(0.75, oPC, lSpawn);
    CutSetCamera(0.75, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 20.0, 60.0, CAMERA_TRANSITION_TYPE_SNAP, FALSE);
    CutSetCamera(1.0, oPC, CAMERA_MODE_TOP_DOWN, 180.0, 10.0, 70.0, CAMERA_TRANSITION_TYPE_SLOW, FALSE);

    // End Cutscene
    CutFadeOutAndIn(10.0, oPC);

    //Clean up actors...
    CutDisableCutscene(nCutsceneNumber, 10.5, 10.5, RESTORE_TYPE_NORMAL);

    //Check for next Cutscene
    DelayCommand(12.5, Battle2SpawnNext());
}
//Each Umber Hulk will stalk off until the end of the cutscene,
//at which point it will turn hostile and continue its normal AI
void CreateFirstMindFlayerGroup(object oTarget, location lSpawn)
{

    string szIllithid = "q2a_bat2_mf1";
    string szUmberHulk = "q2a_bat2_mf2";
    DelayCommand(6.0, CreateFirstMindFlayer(szIllithid, oTarget, lSpawn));

    object oUmber1 = CreateObject(OBJECT_TYPE_CREATURE, szUmberHulk, lSpawn);
    location lUmber1 = GetLocation(GetNearestObjectByTag("cut106wp_umber1"));
    ChangeToStandardFaction(oUmber1, STANDARD_FACTION_COMMONER);
    AssignCommand(oUmber1, ActionMoveToLocation(lUmber1));
    SetLocalObject(oUmber1, "oTarget", oTarget);
    DelayCommand(11.0, ChangeToStandardFaction(oUmber1, STANDARD_FACTION_HOSTILE));
    DelayCommand(11.0, AssignCommand(oUmber1, DetermineCombatRound()));
    DelayCommand(12.0, SignalEvent(oUmber1, EventUserDefined(5000)));

    object oUmber2 = CreateObject(OBJECT_TYPE_CREATURE, szUmberHulk, lSpawn);
    location lUmber2 = GetLocation(GetNearestObjectByTag("cut106wp_umber2"));
    ChangeToStandardFaction(oUmber2, STANDARD_FACTION_COMMONER);
    AssignCommand(oUmber2, ActionMoveToLocation(lUmber1));
    SetLocalObject(oUmber2, "oTarget", oTarget);
    DelayCommand(11.0, ChangeToStandardFaction(oUmber2, STANDARD_FACTION_HOSTILE));
    DelayCommand(11.0, AssignCommand(oUmber2, DetermineCombatRound()));
    DelayCommand(12.0, SignalEvent(oUmber2, EventUserDefined(5000)));

    object oUmber3 = CreateObject(OBJECT_TYPE_CREATURE, szUmberHulk, lSpawn);
    location lUmber3 = GetLocation(GetNearestObjectByTag("cut106wp_umber3"));
    ChangeToStandardFaction(oUmber3, STANDARD_FACTION_COMMONER);
    AssignCommand(oUmber3, ActionMoveToLocation(lUmber1));
    SetLocalObject(oUmber3, "oTarget", oTarget);
    DelayCommand(11.0, ChangeToStandardFaction(oUmber3, STANDARD_FACTION_HOSTILE));
    DelayCommand(11.0, AssignCommand(oUmber3, DetermineCombatRound()));
    DelayCommand(12.0, SignalEvent(oUmber3, EventUserDefined(5000)));
}

//Create 3 Umber Hulks followed by 2 mind flayers
void CreateMindFlayerGroup(object oTarget, location lSpawn)
{

    string szIllithid = "q2a_bat2_mf1";
    string szUmberHulk = "q2a_bat2_mf2";
    DelayCommand(6.0, CreateMindFlayer(szIllithid, oTarget, lSpawn));

    object oUmber1 = CreateObject(OBJECT_TYPE_CREATURE, szUmberHulk, lSpawn);
    SetLocalObject(oUmber1, "oTarget", oTarget);
    DelayCommand(10.0, AssignCommand(oUmber1, DetermineCombatRound()));
    DelayCommand(6.0, SignalEvent(oUmber1, EventUserDefined(5000)));

    object oUmber2 = CreateObject(OBJECT_TYPE_CREATURE, szUmberHulk, lSpawn);
    SetLocalObject(oUmber2, "oTarget", oTarget);
    DelayCommand(10.0, AssignCommand(oUmber2, DetermineCombatRound()));
    DelayCommand(6.0, SignalEvent(oUmber2, EventUserDefined(5000)));

    object oUmber3 = CreateObject(OBJECT_TYPE_CREATURE, szUmberHulk, lSpawn);
    SetLocalObject(oUmber3, "oTarget", oTarget);
    DelayCommand(10.0, AssignCommand(oUmber3, DetermineCombatRound()));
    DelayCommand(6.0, SignalEvent(oUmber3, EventUserDefined(5000)));
}

//Create the 2 mindflayers of a mind flayer group
void CreateFirstMindFlayer(string szIllithid, object oTarget, location lSpawn)
{
    object oIllithid1 = CreateObject(OBJECT_TYPE_CREATURE, szIllithid, lSpawn);
    SetLocalObject(oIllithid1, "oTarget", oTarget);
    //location lIllithid1 = GetNearestObjectByTag("cut106wp_mf1");
    ChangeToStandardFaction(oIllithid1, STANDARD_FACTION_COMMONER);
    AssignCommand(oIllithid1, ActionPlayAnimation(ANIMATION_LOOPING_CONJURE1));
    SetLocalObject(oIllithid1, "oTarget", oTarget);
    DelayCommand(6.0, ChangeToStandardFaction(oIllithid1, STANDARD_FACTION_HOSTILE));
    DelayCommand(6.0, AssignCommand(oIllithid1, DetermineCombatRound()));
    DelayCommand(7.0, SignalEvent(oIllithid1, EventUserDefined(5000)));

    object oIllithid2 = CreateObject(OBJECT_TYPE_CREATURE, szIllithid, lSpawn);
    SetLocalObject(oIllithid2, "oTarget", oTarget);
    //location lIllithid2 = GetNearestObjectByTag("cut106wp_mf1");
    ChangeToStandardFaction(oIllithid2, STANDARD_FACTION_COMMONER);
    AssignCommand(oIllithid2, ActionPlayAnimation(ANIMATION_LOOPING_CONJURE1));
    SetLocalObject(oIllithid2, "oTarget", oTarget);
    DelayCommand(6.0, ChangeToStandardFaction(oIllithid2, STANDARD_FACTION_HOSTILE));
    DelayCommand(6.0, AssignCommand(oIllithid2, DetermineCombatRound()));
    DelayCommand(7.0, SignalEvent(oIllithid2, EventUserDefined(5000)));

}
//Create the 2 mindflayers of a mind flayer group
void CreateMindFlayer(string szIllithid, object oTarget, location lSpawn)
{
    object oIllithid1 = CreateObject(OBJECT_TYPE_CREATURE, szIllithid, lSpawn);
    SetLocalObject(oIllithid1, "oTarget", oTarget);
    AssignCommand(oIllithid1, DetermineCombatRound());
    DelayCommand(6.0, SignalEvent(oIllithid1, EventUserDefined(5000)));

    object oIllithid2 = CreateObject(OBJECT_TYPE_CREATURE, szIllithid, lSpawn);
    SetLocalObject(oIllithid2, "oTarget", oTarget);
    AssignCommand(oIllithid2, DetermineCombatRound());
    DelayCommand(6.0, SignalEvent(oIllithid2, EventUserDefined(5000)));

}

//Create the rock effects for the appearance of UmberHulks
void RockEffects(location lSpawn1)
{
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(354), lSpawn1);
    CreateObject(OBJECT_TYPE_PLACEABLE, "x2_plc_hole_b", lSpawn1);
}

void Battle2SpawnNext()
{
    object oBattleMaster = GetObjectByTag("q2abattle2master");
    if (GetGlobalInt("x2_plot_beholders_out") == 0)
    {
        ExecuteScript("bat2_beholders", oBattleMaster);
        //When executed - after the cutscene - this script will spawn in the regular attackers

    }
    //else just spawn in the regular attackers and start the battle
    else
    {
        ExecuteScript("bat2_regulars", oBattleMaster);
    }
}
