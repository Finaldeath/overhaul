//::///////////////////////////////////////////////
//:: Name bat2_beholders
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
 //The Matron will have beholders unless x2_plot_beholders_out has been set to 1
    //bat2wp_beholderspawn1-5
    //Spawn in some Beholders - show via cutscene
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

#include "x2_inc_cutscene"
#include "nw_i0_generic"
#include "x2_inc_globals"

int nCutsceneNumber = 107;

void StartCutscene(object oPC, location lSpawn);

//Create a creature that uses the flying animation on spawn in
void CreateFlyer(string szResRef, object oTarget, location lSpawn);
void CreateFirstFlyer(string szResRef, object oTarget, location lSpawn);
void Battle2SpawnNext();

void main()
{

    object oSeer = GetObjectByTag("q2aseer");
    //Get the PC object (stored on the battle herald)
    object oHerald = GetObjectByTag("q2arebimloth");
    object oPC = GetLocalObject(oHerald, "oLeader");

    string szBeholder = "q2a_bat2_beh1";
    string szBeholderMage = "q2a_bat2_beh2";
    string szSpawn = "bat2wp_beholderspawn";
    int nRandom = Random(5) + 1;
    object oSpawn = GetWaypointByTag(szSpawn + IntToString(nRandom));
    //Create an initial wave of beholders - 2 at 2 different spawn points

    nRandom = nRandom + 1;
    if (nRandom > 5)
        nRandom = 1;

    oSpawn = GetWaypointByTag(szSpawn + IntToString(nRandom));
    location lSpawn = GetLocation(oSpawn);
    StartCutscene(oPC, lSpawn);
    DelayCommand(2.0, CreateFirstFlyer(szBeholder, oSeer, lSpawn));
    DelayCommand(12.0, CreateFlyer(szBeholderMage, oSeer, lSpawn));
    DelayCommand(12.0, CreateFlyer(szBeholderMage, oSeer, lSpawn));
    DelayCommand(12.0, CreateFlyer(szBeholder, oSeer, lSpawn));
}

void StartCutscene(object oPC, location lSpawn)
{

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

void Battle2SpawnNext()
{
    object oBattleMaster = GetObjectByTag("q2abattle2master");

    //just spawn in the regular attackers and start the battle
    ExecuteScript("bat2_regulars", oBattleMaster);
}

//Create a creature that uses the flying animation on spawn in
void CreateFlyer(string szResRef, object oTarget, location lSpawn)
{
    object oCaster = CreateObject(OBJECT_TYPE_CREATURE, szResRef, lSpawn, TRUE);
    SetLocalObject(oCaster, "oTarget", oTarget);
    DelayCommand(6.0, AssignCommand(oCaster, DetermineCombatRound()));
    DelayCommand(6.0, SignalEvent(oCaster, EventUserDefined(5000)));
}

//Create a creature that uses the flying animation on spawn in
void CreateFirstFlyer(string szResRef, object oTarget, location lSpawn)
{
    object oCaster = CreateObject(OBJECT_TYPE_CREATURE, szResRef, lSpawn, TRUE);
    ChangeToStandardFaction(oCaster, STANDARD_FACTION_COMMONER);
    SetLocalObject(oCaster, "oTarget", oTarget);
    DelayCommand(11.0, ChangeToStandardFaction(oCaster, STANDARD_FACTION_HOSTILE));
    DelayCommand(12.0, AssignCommand(oCaster, DetermineCombatRound()));
    DelayCommand(14.0, SignalEvent(oCaster, EventUserDefined(5000)));
}
