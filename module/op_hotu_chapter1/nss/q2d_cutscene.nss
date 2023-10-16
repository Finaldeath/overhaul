// Start the Halaster cutscene:
// - Player turns invisible.
// - Move camera towards Halaster and the drow.
// - The priestess demands info from Halaster (priestess - Halaster dialog)
// - Priestess uses spell on Halaster.
// - Halaster screams.
// - One of the mages complains that Halaster is useless (priestess - mage dialog).
// - Priestess threatens Halaster again.
// - Drow suspects that are intruders nearby but does not notice yet.
// - End of cutscene.

#include "x2_inc_cutscene"

int CUTSCENE_NUMBER = 33;
string DIALOG1 = "q2d_cut1";
string DIALOG2 = "q2d_cut2";

void CreateCopy(object oPC)
{
    if(CutGetActiveCutsceneForObject(oPC) == CUTSCENE_NUMBER)
    {
        location lSpawn = GetLocation(GetWaypointByTag("wp_cut33clonespawn"));
        CutCreatePCCopy(oPC, lSpawn, GetTag(oPC));
    }
}

void main()
{
    //Make sure Nathyra is no longer plot for the last battle
    object oNathyra = GetObjectByTag("x2_hen_nathyrra");
    SetPlotFlag(oNathyra, FALSE);

    object oPC = GetLastOpenedBy();

    if(!GetIsPC(oPC))
        return;
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_CUTSCENE_ONCE");
    if(nDoOnce == 1)
        return;

    BlackScreen(oPC);

    SetLocalInt(OBJECT_SELF, "DO_CUTSCENE_ONCE", 1);

    object oCamera1 = GetWaypointByTag("q2d_wp_camera1");
    object oCamera2 = GetWaypointByTag("q2d_wp_camera2");
    object oWPCheck = GetWaypointByTag("q2d_wp_check");


    float fConDur1 = CutGetConvDuration(DIALOG1);
    float fConDur2 = CutGetConvDuration(DIALOG2);

    CutSetActiveCutscene(CUTSCENE_NUMBER, CUT_DELAY_TYPE_CUMULATIVE);
    CutSetActiveCutsceneForObject(oPC, CUTSCENE_NUMBER, TRUE);
    CutSetAbortDelay(CUTSCENE_NUMBER, 1.0);
    CutSetDestroyCopyDelay(CUTSCENE_NUMBER, 0.0);
    DelayCommand(3.5, FadeFromBlack(oPC, FADE_SPEED_FAST));
    //CutFadeFromBlack(2.0, oPC, FADE_SPEED_FAST, FALSE);
    CutStoreMusic(0.0, oPC);
    CutSetMusic(0.5, oPC, TRACK_THEME_CHAPTER3);
    DelayCommand(0.5, CreateCopy(oPC));
    CutSetCutsceneMode(0.0, oPC, TRUE, TRUE, TRUE, TRUE);

    CutSetLocation(0.0, oPC);
    CutSetCamera(0.5, oPC, CAMERA_MODE_TOP_DOWN, 270.0, 20.0, 50.0, CAMERA_TRANSITION_TYPE_SNAP);
    CutSetCamera(0.5, oPC, CAMERA_MODE_TOP_DOWN, 270.0, 10.0, 80.0, CAMERA_TRANSITION_TYPE_VERY_SLOW);
    object oHalaster = GetNearestObjectByTag("q2d_halaster");
    object oHandmaiden = GetNearestObjectByTag("q2d_handmaiden");
    object oMage = GetNearestObjectByTag("q2d_mage1");
    object oWarrior = GetNearestObjectByTag("q2d_warrior1");

    CutSetActiveCutsceneForObject(oHalaster, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oHandmaiden, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oMage, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oWarrior, CUTSCENE_NUMBER);

    CutActionMoveToLocation(1.0, oPC, GetLocation(oCamera1), FALSE);
    CutBeginConversation(9.0, oHalaster, oHandmaiden, DIALOG1);
    CutActionCastSpellAtObject(fConDur1 + 0.5, SPELL_NEGATIVE_ENERGY_RAY, oHandmaiden, oHalaster,
        METAMAGIC_ANY, TRUE);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 180.0, 10.0, 50.0, CAMERA_TRANSITION_TYPE_VERY_SLOW);
    CutSpeakStringByStrRef(2.5, oHalaster, 100966);
    CutKnockdown(0.2, oHalaster, 10.0);
    //CutPlayAnimation(0.0, oHalaster, ANIMATION_LOOPING_SPASM, 9999.9);
    CutBeginConversation(3.0, oHandmaiden, oMage, DIALOG2);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 160.0, 10.0, 50.0, CAMERA_TRANSITION_TYPE_VERY_SLOW);

    CutActionMoveToLocation(fConDur2 + 1.0, oWarrior, GetLocation(oWPCheck), TRUE);
    CutAdjustReputation(1.0, oPC, oHandmaiden, -100);
    CutAdjustReputation(0.0, oHandmaiden, oPC, -100);
    CutDestroyPCCopy(0.0, oPC, FALSE);
    CutRestoreMusic(0.0, oPC);
    CutDisableCutscene(CUTSCENE_NUMBER, 2.0, 0.0);

}
