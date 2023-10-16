//::///////////////////////////////////////////////
//:: Name q1a_cut1join
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Any PC after the first one that enters the main
    floor of Drogan's home while Cutscene 1 is running
    will join the cutscene in progress.

*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 3/03
//:://////////////////////////////////////////////
#include "x1_inc_cutscene"
void main()
{
    //The joining PC is running the script so they are OBJECT_SELF
    object oPC = OBJECT_SELF;
    object oDrogan = GetObjectByTag("Drogan");
    SetLocalInt(oPC, "nCutsceneNumber", 1);
    //PCs are immortal for the first cutscene
    SetImmortal(oPC, TRUE);

    //Make sure hostiles will not attack PC until after cutscene is over.
    SetStandardFactionReputation(STANDARD_FACTION_HOSTILE, 100, oPC);

    //Jump PC to the extra PCs spot
    AssignCommand(oPC, ActionJumpToObject(GetWaypointByTag("wp_cut1_pcx")));

    //Black out the screen to prep for a fade in
    BlackScreen(oPC);

    //Have the PC join the cutscene (in progress if necessary)...
    CutSetCutsceneMode(1, 0.0, oPC, TRUE);

    // Remove any effects they may have on.
    //CutRemoveEffects(1, 0.0, oPC);

    // Turn the PC to invisible.
    //CutApplyEffectToObject(1, 0.0, DURATION_TYPE_PERMANENT, VFX_DUR_CUTSCENE_INVISIBILITY,
    //                       oPC, 9999.0);
    AssignCommand(oDrogan, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), oPC));

    // Set the initial camera.
    /* BY THE FIREPLACE ANGLES
    CutSetCamera(1, 1.0, oPC, CAMERA_MODE_TOP_DOWN, 45.0, 20.0, 50.0,
                 CAMERA_TRANSITION_TYPE_SNAP);
    CutSetCamera(1, 4.0, oPC, CAMERA_MODE_TOP_DOWN, 170.0, 20.0, 50.0,
                 CAMERA_TRANSITION_TYPE_SLOW);
    CutSetCamera(1, 10.0, oPC, CAMERA_MODE_TOP_DOWN, 270.0, 10.0, 50.0,
                 CAMERA_TRANSITION_TYPE_SLOW);
    CutSetCamera(1, 15.0, oPC, CAMERA_MODE_TOP_DOWN, 270.0, 20.0, 50.0,
                 CAMERA_TRANSITION_TYPE_SLOW);
     */
    //By the front door angles
    CutSetCamera(1, 1.0, oPC, CAMERA_MODE_TOP_DOWN, 120.0, 20.0, 50.0,
                 CAMERA_TRANSITION_TYPE_SNAP);
    CutSetCamera(1, 4.0, oPC, CAMERA_MODE_TOP_DOWN, 120.0, 10.0, 50.0,
                 CAMERA_TRANSITION_TYPE_VERY_SLOW);
    CutSetCamera(1, 10.0, oPC, CAMERA_MODE_TOP_DOWN, 190.0, 15.0, 50.0,
                 CAMERA_TRANSITION_TYPE_VERY_SLOW);
    CutSetCamera(1, 18.0, oPC, CAMERA_MODE_TOP_DOWN, 170.0, 20.0, 50.0,
                 CAMERA_TRANSITION_TYPE_SLOW);


    //Fade Picture In...
    DelayCommand(1.5, FadeFromBlack(oPC, FADE_SPEED_FAST));
    //Have caption over top of PC
    DelayCommand(5.5, FloatingTextStrRefOnCreature(40415, oPC));
}
