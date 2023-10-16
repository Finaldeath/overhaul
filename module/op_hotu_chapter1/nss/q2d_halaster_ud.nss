// Halaster user-defined event:
// 101: Cutscene Destroy all remaining drow (if any).

int CUTSCENE_NUMBER = 34;

#include "x2_inc_cutscene"

float TIME_START = 0.0;
float TIME_RUN = TIME_START + 1.8;
float TIME_RUN2 = TIME_RUN + 6.3;
float TIME_CAST = TIME_RUN2 + 3.3;
float TIME_END = TIME_CAST + 9.0;

void CreateCopy(object oPC);
void HalTalkToPC(object oPC);

void RemoveAOE()
{
    object oObject = GetFirstObjectInArea(GetArea(OBJECT_SELF));
    while(oObject != OBJECT_INVALID)
    {
        if(GetObjectType(oObject) == OBJECT_TYPE_AREA_OF_EFFECT)
            DestroyObject(oObject);
        oObject = GetNextObjectInArea(GetArea(OBJECT_SELF));
    }
}

void main()
{
    int nEvent = GetUserDefinedEventNumber();

    if(nEvent == 101) // start cutscene
    {
        //Make sure Nathyrra in position for her conversation
        //object oNathyrra = GetObjectByTag("x2_hen_nathyrra");
        //object oWPNath = GetWaypointByTag("wp_q2d_nathend");
        //AssignCommand(oNathyrra, ClearAllActions(TRUE));
        //AssignCommand(oNathyrra, JumpToObject(oWPNath));

        SetLocalInt(OBJECT_SELF, "CAN_TALK", 1);
        effect e = GetFirstEffect(OBJECT_SELF);
        while(GetIsEffectValid(e))
        {
            RemoveEffect(OBJECT_SELF, e);
            e = GetNextEffect(OBJECT_SELF);
        }
        ClearAllActions(); // stand up
        PlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_LEFT, 1.0);
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        RemoveAOE();
        CutSetActiveCutscene(CUTSCENE_NUMBER, CUT_DELAY_TYPE_CONSTANT);
        CutSetActiveCutsceneForObject(oPC, CUTSCENE_NUMBER, TRUE);
        CutFadeOutAndIn(TIME_START, oPC, 2.0);
        DelayCommand(TIME_START + 0.5, CreateCopy(oPC));
        CutSetCutsceneMode(TIME_START + 0.5, oPC, TRUE, TRUE, TRUE, TRUE);
        CutSetLocation(TIME_START, oPC);
        // hold all creatures
        object oCreature = GetFirstObjectInArea(GetArea(OBJECT_SELF));
        effect eHold = EffectCutsceneParalyze();
        while(oCreature != OBJECT_INVALID)
        {
            if(GetObjectType(oCreature) == OBJECT_TYPE_CREATURE &&
                GetTag(oCreature) != "q2d_halaster" && GetTag(oCreature) != "q2d_halas2" && oCreature != oPC)
                    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eHold, oCreature);
            oCreature = GetNextObjectInArea(GetArea(OBJECT_SELF));
        }
        object oCamera = GetNearestObjectByTag("q2d_wp_camera3");
        object oWP1 = GetWaypointByTag("q2d_wp_drow_sp1");
        object oWP2 = GetWaypointByTag("q2d_wp_drow_sp2");
        object oWP3 = GetWaypointByTag("q2d_wp_drow_sp3");
        object oWP4 = GetWaypointByTag("q2d_wp_drow_sp4");
        object oWP5 = GetWaypointByTag("q2d_wp_drow_sp5");

        object oDrow1 = CreateObject(OBJECT_TYPE_CREATURE, "drowmarksman002", GetLocation(oWP1));
        object oDrow2 = CreateObject(OBJECT_TYPE_CREATURE, "drowmarksman002", GetLocation(oWP2));
        object oDrow3 = CreateObject(OBJECT_TYPE_CREATURE, "drowmarksman002", GetLocation(oWP3));
        object oDrow4 = CreateObject(OBJECT_TYPE_CREATURE, "drowmarksman002", GetLocation(oWP4));
        object oDrow5 = CreateObject(OBJECT_TYPE_CREATURE, "drowmarksman002", GetLocation(oWP5));

        CutSetActiveCutsceneForObject(oDrow1, CUTSCENE_NUMBER);
        CutSetActiveCutsceneForObject(oDrow2, CUTSCENE_NUMBER);
        CutSetActiveCutsceneForObject(oDrow3, CUTSCENE_NUMBER);
        CutSetActiveCutsceneForObject(oDrow4, CUTSCENE_NUMBER);
        CutSetActiveCutsceneForObject(oDrow5, CUTSCENE_NUMBER);
       //CutSetActiveCutsceneForObject(oNathyrra, CUTSCENE_NUMBER);
        SetLocalInt(oDrow1, "IS_DROW", 1);
        SetLocalInt(oDrow2, "IS_DROW", 1);
        SetLocalInt(oDrow3, "IS_DROW", 1);
        SetLocalInt(oDrow4, "IS_DROW", 1);
        SetLocalInt(oDrow5, "IS_DROW", 1);
        AdjustReputation(oPC, oDrow1, 50);
        AdjustReputation(oDrow1, oPC, 50);
        CutSetActiveCutsceneForObject(OBJECT_SELF, CUTSCENE_NUMBER);
        object oWPRun1 = GetWaypointByTag("q2d_wp_drow_run1");
        object oWPRun2 = GetWaypointByTag("q2d_wp_drow_run2");
        object oWPRun3 = GetWaypointByTag("q2d_wp_drow_run3");
        object oWPRun4 = GetWaypointByTag("q2d_wp_drow_run4");
        object oWPRun5 = GetWaypointByTag("q2d_wp_drow_run5");
        CutJumpToObject(TIME_START + 1.0, oPC, oCamera);
        CutSetCamera(TIME_START + 1.5, oPC, CAMERA_MODE_TOP_DOWN, 160.0, 18.0, 50.0, CAMERA_TRANSITION_TYPE_SNAP);
        CutSetCamera(TIME_START + 1.5, oPC, CAMERA_MODE_TOP_DOWN, 230.0, 18.0, 50.0, CAMERA_TRANSITION_TYPE_VERY_SLOW);
        CutActionMoveToObject(TIME_RUN, oDrow1, oWPRun1, TRUE);
        CutActionMoveToObject(TIME_RUN, oDrow2, oWPRun2, TRUE);
        CutActionMoveToObject(TIME_RUN + 0.3, oDrow3, oWPRun3, TRUE);
        CutActionMoveToObject(TIME_RUN + 0.3, oDrow4, oWPRun4, TRUE);
        CutActionMoveToObject(TIME_RUN + 0.8, oDrow5, oWPRun5, TRUE);
        CutSpeakStringByStrRef(TIME_RUN2, oDrow1, 84094);
        CutPlayAnimation(TIME_RUN2 + 1.0, oDrow1, ANIMATION_FIREFORGET_VICTORY1, 0.0);
        CutActionMoveToObject(TIME_RUN2 + 2.5, oDrow1, OBJECT_SELF, TRUE);
        CutActionMoveToObject(TIME_RUN2 + 3.0, oDrow2, OBJECT_SELF, TRUE);
        CutActionMoveToObject(TIME_RUN2 + 3.3, oDrow3, OBJECT_SELF, TRUE);
        CutActionMoveToObject(TIME_RUN2 + 3.6, oDrow4, OBJECT_SELF, TRUE);
        CutActionMoveToObject(TIME_RUN2 + 3.9, oDrow5, OBJECT_SELF, TRUE);
        CutClearAllActions(TIME_CAST, OBJECT_SELF, TRUE);
        CutActionCastFakeSpellAtObject(TIME_CAST + 0.1, SPELL_POWER_WORD_KILL, OBJECT_SELF, OBJECT_SELF, PROJECTILE_PATH_TYPE_DEFAULT);
        CutSetCamera(TIME_CAST + 0.1, oPC, CAMERA_MODE_TOP_DOWN, 250.0, 15.0, 60.0, CAMERA_TRANSITION_TYPE_VERY_SLOW);
        CutSpeakStringByStrRef(TIME_CAST + 0.1, OBJECT_SELF, 84093);
        oCreature = GetFirstObjectInArea(GetArea(OBJECT_SELF));
        int bIsDrow;
        effect eDeath = EffectDamage(3000);
        float fDelay;
        float fDistance;
        float fDif;

        while(oCreature != OBJECT_INVALID)
        {
            bIsDrow = GetLocalInt(oCreature, "IS_DROW");
            if(bIsDrow)
            {
                CutSetActiveCutsceneForObject(oCreature, CUTSCENE_NUMBER);
                fDistance = GetDistanceBetween(OBJECT_SELF, oCreature);
                fDif += 0.1;
                fDelay = 0.07 * fDistance;
                CutApplyEffectToObject(TIME_CAST + 2.0 + fDif, DURATION_TYPE_INSTANT, VFX_IMP_MIRV, oCreature, 0.0);
                CutApplyEffectToObject2(TIME_CAST + 2.0 + fDelay + fDif, DURATION_TYPE_INSTANT, eDeath, oCreature, 0.0);
            }
            oCreature = GetNextObjectInArea(GetArea(OBJECT_SELF));
        }

        CutFadeOutAndIn(TIME_END, oPC, 2.5);
        //CutJumpToObject(TIME_END - 0.5, oNathyrra, oWPNath);
        CutDisableCutscene(CUTSCENE_NUMBER, TIME_END + 2.0, TIME_END);
        //DelayCommand(TIME_END + 3.0, AssignCommand(oPC, ClearAllActions(TRUE)));
        //DelayCommand(TIME_END + 3.5, HalTalkToPC(oPC));

    }

}

void HalTalkToPC(object oPC)
{
    if (IsInConversation(OBJECT_SELF) == FALSE)
        ActionStartConversation(oPC);
}
void CreateCopy(object oPC)
{
    if(CutGetActiveCutsceneForObject(oPC) == CUTSCENE_NUMBER)
        CutCreatePCCopy(oPC, GetLocation(oPC), GetTag(oPC));
}


