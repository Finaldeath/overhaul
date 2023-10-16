//::///////////////////////////////////////////////
//:: Name  q1a_cut1abort
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Cutscene 1 - the Kobold attack on Drogan's home.
    If aborted by the lead PC - Fade to Black,
    wipe out all the furniture and kobolds.
    Create ruined furniture.
    Knockout Drogan and ensure all henchmen and Ayala
    are spawned in.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Nov 8/02
//:://////////////////////////////////////////////
#include "nw_i0_tool"
#include "x1_inc_cutscene"

void RemoveEffects(object oCreature);
void RemoveCutInvis(object oCreature);
void main()
{
    //Fade All PCs to Black
    object oPC = GetFirstPC();
    while (oPC != OBJECT_INVALID)
    {
        if (GetLocalInt(oPC, "nCutsceneNumber") == 1)
        {
            CutFadeOutAndIn(1, 0.0, oPC, FALSE);
        }
        oPC = GetNextPC();
    }

    object oDrogan = GetObjectByTag("Drogan");
    object oArea = GetObjectByTag("q1a1drogonfloor1");

    //Try to end the cutscene battle music
    MusicBattleStop(oArea);

    //Destroy All Objects that need destroying
    object oThing = GetFirstObjectInArea(oArea);
    while (oThing != OBJECT_INVALID)
    {

        if (GetStringLeft(GetTag(oThing), 5) == "cut1k" || GetStringLeft(GetTag(oThing), 5) == "cut1p" || GetStringLeft(GetTag(oThing), 7) == "q1a_k_t"|| GetStringLeft(GetTag(oThing), 6) == "cut1_a" || GetStringLeft(GetTag(oThing), 6) == "cut1_f" || GetStringLeft(GetTag(oThing), 6) == "cut1_t")
        {
            DestroyObject(oThing);
        }
        oThing = GetNextObjectInArea(oArea);
    }

    //Check if front door is openned
    object oFrontDoor = GetObjectByTag("q1a_door_int");
    if (GetIsOpen(oFrontDoor) == FALSE)
        AssignCommand(oFrontDoor, ActionOpenDoor(oFrontDoor));
    //Take care of upstairs door
    object oTopFloorDoor = GetObjectByTag("q1a2doortop");
    SetLocalInt(oTopFloorDoor, "nCutSceneReady", 2);
    SetLocked(oTopFloorDoor, FALSE);
    //Make sure Drogan is down
    SetCommandable(TRUE, oDrogan);
    SetPlotFlag(oDrogan, FALSE);
    RemoveEffects(oDrogan);

    DelayCommand(0.5, AssignCommand(oDrogan, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK, 0.5, 19999.0)));
    DelayCommand(2.0, SetPlotFlag(oDrogan, TRUE));
    DelayCommand(3.0, SetCommandable(FALSE, oDrogan));

    //PC locations
    location lPCTeleport = GetLocation(GetWaypointByTag("X1_TPORT_LOC"));
    location lStairs = GetLocation(GetWaypointByTag("wp_q2a_at_stairs"));
    //Henchmen spawn locations
    location lMischa = GetLocation(GetWaypointByTag("wp_cut1mis_spn"));
    location lXan = GetLocation(GetWaypointByTag("wp_cut1xan_spn"));
    location lDorna = GetLocation(GetWaypointByTag("wp_cut1dor_spn"));

    location lAyala = GetLocation(oDrogan);
    //effects
    effect eEffectDrogan = EffectKnockdown();
    effect eTeleport = EffectVisualEffect(VFX_IMP_HEALING_G);

    //Check for Dorna
    if (GetObjectByTag("x0_hen_dor") == OBJECT_INVALID)
        CreateObject(OBJECT_TYPE_CREATURE, "x0_hen_dor", lDorna);

    //Check for Ayala
    if (GetObjectByTag("Ayala") == OBJECT_INVALID)
        CreateObject(OBJECT_TYPE_CREATURE, "ayala", lAyala);

    //Check for Mischa
    if (GetObjectByTag("x0_hen_mis") == OBJECT_INVALID)
        CreateObject(OBJECT_TYPE_CREATURE, "x0_hen_mis", lMischa);

    //Check for Xanos
    if (GetObjectByTag("x0_hen_xan") == OBJECT_INVALID)
        CreateObject(OBJECT_TYPE_CREATURE, "x0_hen_xan", lXan);



    //Drogan's Staff

    object oStaff = GetItemPossessedBy(oDrogan, "walkingstick");
    if (oStaff != OBJECT_INVALID)
    {
        DestroyObject(oStaff);
        CreateObject(OBJECT_TYPE_ITEM, "walkingstick", GetLocation(GetWaypointByTag("wp_q1a1_staff")));
    }
    //Also take Drogan down to 10 hp...
    int nDamage = GetCurrentHitPoints(oDrogan) - 10;
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nDamage), oDrogan);

    //Return ALL PCs to starting positions if they joined the cutscene
    //If the PC came from the stairs - appear at the stairs
    location lTarget1, lLooter;
    vector vTarget;
    object oPlayers = GetFirstPC();
    while (oPlayers != OBJECT_INVALID)
    {
        //Make sure hostiles will attack PC until after cutscene is over.
        SetStandardFactionReputation(STANDARD_FACTION_HOSTILE, 0, oPlayers);
        if (GetLocalInt(oPlayers, "nCutsceneNumber") == 1)
        {
            AssignCommand(oPlayers, ClearAllActions());
            //PCs are immortal for the first cutscene - make sure they are not when they leave it
            SetImmortal(oPlayers, FALSE);
            if (GetLocalInt(oPlayers, "nQ1AStairs") == 1)
            {
                DelayCommand(2.0, AssignCommand(oPlayers, ActionJumpToLocation(lStairs)));
            }
            else
            {
                //Only create 1 set of effects or it will get crazy
                if (GetLocalInt(GetModule(),"X1_Q1PORTALJUMP") != 1)
                {
                    SetLocalInt(GetModule(), "X1_Q1PORTALJUMP", 1);
                    vTarget= GetPosition(GetWaypointByTag("X1_TPORT_LOC"));
                    vTarget = Vector(vTarget.x, vTarget.y, vTarget.z + 1.0);
                    lTarget1 = Location(GetArea(GetWaypointByTag("X1_TPORT_LOC")), vTarget, 0.0);

                    DelayCommand(2.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_HEALING_G), lPCTeleport));
                    DelayCommand(2.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_HEALING_G), lTarget1));

                }

                DelayCommand(2.0, AssignCommand(oPlayers, ActionJumpToLocation(lPCTeleport)));
            }
            DelayCommand(2.0, SetCutsceneMode(oPlayers, FALSE));
            DelayCommand(2.0, SetCommandable(TRUE, oPlayers));

            DelayCommand(2.5, RemoveCutInvis(oPlayers));
            DelayCommand(2.5, AssignCommand(oPlayers, ClearAllActions(TRUE)));
            DelayCommand(5.0, SetLocalInt(oPlayers, "nCutsceneNumber", 0));
        }

        oPlayers = GetNextPC();
    }
    SetLocalInt(GetModule(), "X1_CUT1RUNNING", 2);
    //Change Drogan's AI back to default
    SetAILevel(oDrogan, AI_LEVEL_DEFAULT);
    //change the background music
    SetLocalInt(oArea, "nMusicChanged", 1);
    MusicBackgroundStop(oArea);
    MusicBackgroundChangeDay(oArea, TRACK_CITYMARKET);
    MusicBackgroundChangeNight(oArea, TRACK_CITYNIGHT);
    MusicBackgroundPlay(oArea);

    //disable cutscene trigger
    object oTrigger = GetObjectByTag("q1a1_entstart_cut1");
    SetLocalInt(oTrigger, "nCutSceneReady", 0);

    //Aborted Variable
    SetLocalInt(GetModule(), "nCut1Aborted", 1);
}

void RemoveEffects(object oCreature)
{
    effect eEff1 = GetFirstEffect(oCreature);
    while(GetIsEffectValid(eEff1))
    {
        RemoveEffect(oCreature, eEff1);

        eEff1 = GetNextEffect(oCreature);
    }
}
void RemoveCutInvis(object oCreature)
{
    object oDrogan = GetObjectByTag("Drogan");
    effect eEff1 = GetFirstEffect(oCreature);
    while(GetIsEffectValid(eEff1))
    {
        if (GetName(GetEffectCreator(eEff1)) == GetName(oDrogan))
        {
            RemoveEffect(oCreature, eEff1);
        }
        eEff1 = GetNextEffect(oCreature);
    }
}
