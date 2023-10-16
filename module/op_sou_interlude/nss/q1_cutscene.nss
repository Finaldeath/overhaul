// Manticore cutscene:
// - Focus on doors closing.
// - Focus on Manticore door opening
// - Focus on Manticore comes out of lair.

#include "nw_i0_generic"
#include "x1_inc_cutscene"

int CUTSCENE_NUMBER = 1;
float TIME_START = 0.0;
float TIME_AFTER_FADE = TIME_START + 3.0;
float TIME_CAMERA1 = TIME_AFTER_FADE + 1.0;
float TIME_CAMERA2 = TIME_CAMERA1 + 2.0;
float TIME_CAMERA3 = TIME_CAMERA2 + 2.0;
float TIME_CAMERA4 = TIME_CAMERA3 + 3.5;
float TIME_END = TIME_CAMERA4 + 17.0;

object oNewPC;

void FreezeAll(object oPC)
{
    int n = 1;
    float fDistance;
    effect eHold = EffectCutsceneParalyze();
    object oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oPC, n);
    while (oCreature != OBJECT_INVALID)
    {
        if(oCreature != oPC && GetTag(oCreature) != "Q1_MANTICORE")
        {
            fDistance = GetDistanceBetween(oPC, oCreature);
            if(fDistance > 60.0)
                return;
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eHold, oCreature, TIME_END);

        }
        oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oPC, n);
        n++;
    }
}

void CloseDoor(object oDoor, object oPC)
{
    AssignCommand(oDoor, ActionCloseDoor(oDoor)); // close southern door
    SetLocked(oDoor, TRUE);
    AssignCommand(oPC, PlaySound("as_dr_woodvlgcl1"));
}

void ManticoreAttack(object oManticore, object oPC)
{
    object oPlayer = GetFirstPC();
    while(oPlayer != OBJECT_INVALID)
    {
        AdjustReputation(oPlayer, oManticore, -100);
        AdjustReputation(oManticore, oPlayer, -100);
        oPlayer = GetNextPC();
    }
    //SetIsTemporaryEnemy(oManticore, GetFirstPC());
    AssignCommand(oManticore, ActionMoveToObject(oPC, TRUE, 15.0));
    AssignCommand(oManticore, ActionDoCommand(DetermineCombatRound(oPC)));
}

void CreatePCCopy(object oPC)
{
    oNewPC = CopyObject(oPC, GetLocation(oPC));
    SetPlotFlag(oNewPC, TRUE);
    SetLocalInt(oNewPC, "nCutsceneNumber", CUTSCENE_NUMBER);
    SetLocalObject(GetModule(), "Q1_PC_COPY", oNewPC);
}

void DestroyPCCopy()
{
    object oCopy = GetLocalObject(GetModule(), "Q1_PC_COPY");
    SetPlotFlag(oCopy, FALSE);
    DestroyObject(oCopy);
}

void StartCutscene(object oPC)
{
    int nDoOnce = GetLocalInt(GetArea(OBJECT_SELF), "DO_MANTICORE_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(GetArea(OBJECT_SELF), "DO_MANTICORE_ONCE", 1);

    AssignCommand(oPC, ClearAllActions());

    SetLocalInt(oPC, "nCutsceneNumber", CUTSCENE_NUMBER);
    SetLocalInt(oPC, "nCUT1MAINPC", 1);
    SetLocalInt(GetModule(), "X1_CUT1RUNNING", CUTSCENE_NUMBER);

    object oPlayer = GetFirstPC();
    while(oPlayer != OBJECT_INVALID)
    {
        // send a message to any non-main pc
        if(oPlayer != oPC)
            DelayCommand(4.0, FloatingTextStrRefOnCreature(76451, oPlayer));
        SetLocalInt(oPlayer, "nCutsceneNumber", CUTSCENE_NUMBER);
        CutSetCutsceneMode(CUTSCENE_NUMBER, TIME_START, oPlayer, TRUE, TRUE, TRUE);
        object oDominated = FreezeAssociate(oPlayer);
        if (GetIsObjectValid(oDominated) == TRUE)
            SetLocalObject(oPlayer, "oDominated", oDominated);
        CutFadeOutAndIn(CUTSCENE_NUMBER, TIME_START + 1.0, oPlayer);
        oPlayer = GetNextPC();
    }

    object oDoor1 = GetNearestObjectByTag("Q1_MANTICORE_DOOR1");
    object oDoor2 = GetNearestObjectByTag("Q1_MANTICORE_DOOR2");
    object oDoor3 = GetNearestObjectByTag("Q1_MANTICORE_DOOR3");
    object oManticore = GetNearestObjectByTag("Q1_MANTICORE");
    object oWP = GetWaypointByTag("Q1_WP_MANTICORE_RUN");
    object oWP1 = GetWaypointByTag("Q1_WP_CAMERA1");
    object oWP2 = GetWaypointByTag("Q1_WP_CAMERA2");
    object oWP3 = GetWaypointByTag("Q1_WP_CAMERA3");
    object oWP4 = GetWaypointByTag("Q1_WP_CAMERA4");
    object oPlayerWP = GetNearestObjectByTag("Q1_WP_JUMP_PLAYER", oPC);
    /*object oWP1a = GetWaypointByTag("Q1_WP_CAMERA1a");
    object oWP2a = GetWaypointByTag("Q1_WP_CAMERA2a");
    object oWP3a = GetWaypointByTag("Q1_WP_CAMERA3a");*/

    // create a copy of the player for the camera
    //CutRemoveEffects(CUTSCENE_NUMBER, TIME_START, oPC);
    CutSetLocation(CUTSCENE_NUMBER, TIME_START, oPC);
    CutJumpToLocation(CUTSCENE_NUMBER, TIME_START + 1.0, oPC, GetLocation(oPlayerWP));
    DelayCommand(TIME_START + 1.5, CreatePCCopy(oPC));

    CutApplyEffectToObject(CUTSCENE_NUMBER, TIME_START + 3.0, DURATION_TYPE_PERMANENT, VFX_DUR_CUTSCENE_INVISIBILITY,
                           oPC, 9999.0);
    DelayCommand(TIME_START + 2.0, FreezeAll(oPC));


    CutJumpToLocation(CUTSCENE_NUMBER, TIME_CAMERA1 - 0.5, oPC, GetLocation(oWP1));
    CutSetFacingPoint(CUTSCENE_NUMBER, TIME_CAMERA1 - 0.5, oPC, GetTag(oDoor1));

    CutSetCamera(CUTSCENE_NUMBER, TIME_CAMERA1, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 30.0, 60.0,
                 CAMERA_TRANSITION_TYPE_SNAP);
    CutSetCamera(CUTSCENE_NUMBER, TIME_CAMERA1 + 0.5, oPC, CAMERA_MODE_TOP_DOWN, 45.0, 10.0, 60.0,
                 CAMERA_TRANSITION_TYPE_MEDIUM);
    DelayCommand(TIME_CAMERA1 + 1.0, CloseDoor(oDoor1, oPC));



    CutActionMoveToLocation(CUTSCENE_NUMBER, TIME_CAMERA2, oPC, GetLocation(oWP2), TRUE);
    CutSetCamera(CUTSCENE_NUMBER, TIME_CAMERA2, oPC, CAMERA_MODE_TOP_DOWN, 0.0, 10.0, 60.0,
                 CAMERA_TRANSITION_TYPE_MEDIUM);
    CutSetCamera(CUTSCENE_NUMBER, TIME_CAMERA2 + 1.0, oPC, CAMERA_MODE_TOP_DOWN, 330.0, 10.0, 60.0,
                 CAMERA_TRANSITION_TYPE_MEDIUM);


    CutActionMoveToLocation(CUTSCENE_NUMBER, TIME_CAMERA3, oPC, GetLocation(oWP3), TRUE);
    CutSetCamera(CUTSCENE_NUMBER, TIME_CAMERA3, oPC, CAMERA_MODE_TOP_DOWN, 270.0, 20.0, 60.0,
                 CAMERA_TRANSITION_TYPE_MEDIUM);

    DelayCommand(TIME_CAMERA4 + 0.5, CloseDoor(oDoor2, oPC));

    CutSetCamera(CUTSCENE_NUMBER, TIME_CAMERA4 - 1.0, oPC, CAMERA_MODE_TOP_DOWN, 180.0, 30.0, 60.0,
                 CAMERA_TRANSITION_TYPE_SLOW);

    CutActionMoveToLocation(CUTSCENE_NUMBER, TIME_CAMERA4, oPC, GetLocation(oWP4), TRUE);
    DelayCommand(TIME_CAMERA4 + 7.0, MusicBattleChange(GetArea(OBJECT_SELF), 44));
    DelayCommand(TIME_CAMERA4 + 8.0, MusicBattlePlay(GetArea(OBJECT_SELF)));
    DelayCommand(TIME_CAMERA4 + 12.0, MusicBattlePlay(GetArea(OBJECT_SELF)));

    //CutJumpToLocation(CUTSCENE_NUMBER, TIME_CAMERA3, oPC, GetLocation(oWP3));

    DelayCommand(TIME_CAMERA4 + 10.0, AssignCommand(oDoor3, ActionOpenDoor(oDoor3)));
    DelayCommand(TIME_CAMERA4 + 10.0, AssignCommand(oManticore, ClearAllActions()));
    DelayCommand(TIME_CAMERA4 + 10.0, AssignCommand(oManticore, ActionMoveToObject(oWP)));
    DelayCommand(TIME_CAMERA4 + 10.0, AssignCommand(oPC, PlaySound("as_dr_woodvlgop1")));
    DelayCommand(TIME_CAMERA4 + 12.0, AssignCommand(oPC, PlaySound("c_x0sphinx_atk1")));
    DelayCommand(TIME_CAMERA4 + 12.0, AssignCommand(oPC, SetFacingPoint(GetPosition(oManticore))));
    //CutActionMoveToLocation(CUTSCENE_NUMBER, TIME_CAMERA3 + 0.5, oPC, GetLocation(oWP3a), FALSE);


    CutRestoreLocation(CUTSCENE_NUMBER, TIME_END, oPC);
    CutRemoveEffects(CUTSCENE_NUMBER, TIME_END, oPC);
    //CutDestroyObject(CUTSCENE_NUMBER, TIME_END, oNewPC);
    DelayCommand(TIME_END - 2.0, DestroyPCCopy());
    oPlayer = GetFirstPC();
    while(oPlayer != OBJECT_INVALID)
    {
        CutSetCutsceneMode(CUTSCENE_NUMBER, TIME_END, oPlayer, FALSE);
        DelayCommand(TIME_END, UnFreezeAssociate(oPlayer));
        oPlayer = GetNextPC();
    }

    DelayCommand(TIME_END + 2.0, ManticoreAttack(oManticore, oPC));
    DelayCommand(TIME_END + 40.0, MusicBattleChange(GetArea(OBJECT_SELF), 39));

}
