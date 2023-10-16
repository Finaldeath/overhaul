//::///////////////////////////////////////////////
//:: Name hx_fend_onenter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will run the ending cutscene.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: July 15, 2003
//:://////////////////////////////////////////////
#include "hx_inc_ending"
// Standard cutscene start
void StartCutscene(object oPC, int iCut);

void main()
{
    object oTile;

    // Flood area with blackness.
    if (GetLocalInt(OBJECT_SELF, "nDoOnce") != 1 && GetIsPC(oPC))
    {
        SetLocalInt(OBJECT_SELF, "nDoOnce", 1);
        int nColumns = 12;
        int nRows = 12;

        TLChangeAreaGroundTiles(OBJECT_SELF, 506, nColumns, nRows, 2.43);

        // remove all effects from the PC
        effect e = GetFirstEffect(oPC);
        while(GetIsEffectValid(e))
        {
            RemoveEffect(oPC, e);
            e = GetNextEffect(oPC);
        }
        // Start the scene.
        BlackScreen(oPC);

        while(!GetCommandable(oPC))
        {
            SetCommandable(TRUE, oPC);
        }

        DelayCommand(1.0, StartCutscene(oPC, iCut));
    }
}

void StartCutscene(object oPC, int iCut)
{
    // Create Meph
    CreateObject(OBJECT_TYPE_CREATURE, "hx_mephend_final", GetLocation(GetObjectByTag("hx_mephend_final_wp")));

    // Setup the scene
    CutSetActiveCutscene(iCut, CUT_DELAY_TYPE_CONSTANT);
    CutSetActiveCutsceneForObject(oPC, iCut, TRUE);

    // Actors.
    CutSetActiveCutsceneForObject(oScribe, iCut, TRUE);

    // PC Copy.
    location lLoc = GetLocation(GetNearestObjectByTag("hx_fend_copy_wp", oPC));
    object oPCCopy = CutCreatePCCopy(oPC, lLoc, "HX_PC_FEND_COPY");
    CutSetActiveCutsceneForObject(oPCCopy, iCut);

    // Setup the cutscene.
    CutSetCutsceneMode(1.1, oPC, TRUE, CUT_CAMERA_HEIGHT_LOW, TRUE, 2);
    CutSetCamera(2.2, oPC, CAMERA_MODE_TOP_DOWN, 235.0, 12.0, 65.0,
               CAMERA_TRANSITION_TYPE_SNAP);
    CutJumpToLocation(2.3, oPC, lPCStart);
    CutFadeFromBlack(2.5, oPC, FADE_SPEED_MEDIUM);

    CutApplyEffectToObject(2.0, DURATION_TYPE_PERMANENT, VFX_DUR_CUTSCENE_INVISIBILITY, oPCCopy);

    // Start the scene.
    CutSetCamera(2.6, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 5.0, 75.0,
               CAMERA_TRANSITION_TYPE_SLOW);
    //CutActionSit(2.0, oPCCopy, GetObjectByTag("hx_end_throne"));
    //CutPlayAnimation(5.0, oScribe, ANIMATION_LOOPING_GET_MID, 1.0);
    //CutPlaySound(5.5, oPC, "");
    CutPlayAnimation(8.0, oScribe, ANIMATION_LOOPING_GET_MID, 3.0);
    //CutPlaySound(9.5, oPC, "");
    CutBeginConversation(11.5, oPC, oPC, "h10_narrator");

            // Debug
            //CutJumpToLocation(17.0, oPC, lLoc);
            //CutJumpToLocation(22.0, oPC, lPCStart);
            //CutJumpToLocation(25.0, oPC, lLoc);
}
