// End dialog of matron taunting the trapped player in the circle.
// Continue with cutscene 71:

#include "x2_inc_cutscene"

int CUTSCENE_NUMBER = 72;

void CallStartNewModule(int nCutscene, object oObject)
{
    if(nCutscene == GetLocalInt(oObject, "nCutsceneNumber"))
    {
         //Run End of Chapter Script
        if (GetLocalInt(GetModule(), "X2_Chapter2EndScript") != 1)
        {
            SetLocalInt(GetModule(), "X2_Chapter2EndScript", 1);
            ExecuteScript("x2_c2_end", oObject);
        }
        DelayCommand(2.0, StartNewModule("XP2_Chapter3"));
    }
}

void CutStartNewModule(float fDelay, object oObject)
{
    int nCutscene = GetActiveCutsceneNum();
    fDelay = CutCalculateCurrentDelay(fDelay, nCutscene);
    DelayCommand(fDelay, CallStartNewModule(nCutscene, oObject));
}

void CallPlayAnimation2(int nCutscene, object oObject, int nAnimation, float fLength)
{
    if(nCutscene == GetLocalInt(oObject, "nCutsceneNumber"))
    {
        AssignCommand(oObject, PlayAnimation(nAnimation, 0.6, fLength));
    }
}

void CutPlayAnimation2(float fDelay, object oObject, int nAnimation, float fLength, int iShift = TRUE)
{
    int nCutscene = GetActiveCutsceneNum();
    fDelay = CutCalculateCurrentDelay(fDelay, nCutscene);
    DelayCommand(fDelay, DelayCommand(GetShift(oObject, iShift), CallPlayAnimation(nCutscene, oObject, nAnimation, fLength)));
}


void main()
{
    object oPC = GetPCSpeaker();



    object oMeph = GetObjectByTag("q7_meph");
    object oCopy = GetObjectByTag("q7b3_pc_copy");
    object oBloodWP = GetWaypointByTag("q7b3_wp_blood");
    object oScorchWP = GetWaypointByTag("q7b3_wp_scorch");
    object oFlame1 = GetWaypointByTag("q7b3_wp_flame1");
    object oFlame2 = GetWaypointByTag("q7b3_wp_flame2");
    object oFlame3 = GetWaypointByTag("q7b3_wp_flame3");


    string sDelayVariable = "X2_fCutscene" + IntToString(CUTSCENE_NUMBER) + "Delay";
    SetLocalFloat(GetModule(), sDelayVariable, 0.0);
    CutSetActiveCutscene(CUTSCENE_NUMBER, CUT_DELAY_TYPE_CUMULATIVE, FALSE);
    CutActionMoveToObject(0.0, oPC, oCopy, FALSE);
    CutSetCamera(2.0, oPC, CAMERA_MODE_TOP_DOWN, 120.0, 11.0, 80.0, CAMERA_TRANSITION_TYPE_SLOW);
    CutActionCastFakeSpellAtObject(0.5, SPELL_DESTRUCTION, oMeph, oMeph);
    CutApplyEffectToObject(3.0, DURATION_TYPE_INSTANT, VFX_FNF_SUMMON_GATE, oCopy);
    CutApplyEffectToObject(4.0, DURATION_TYPE_INSTANT, 481, oCopy);
    CutApplyEffectToObject(0.0, DURATION_TYPE_INSTANT, VFX_FNF_SCREEN_SHAKE, oCopy);
    CutPlaySound(0.0, oPC, "sff_explfire");
    CutCreateObject(0.0, oPC, OBJECT_TYPE_PLACEABLE, "plc_bloodstain", GetLocation(oBloodWP), 0);
    CutCreateObject(0.0, oPC, OBJECT_TYPE_PLACEABLE, "plc_weathmark", GetLocation(oFlame1), 0);
    CutCreateObject(0.0, oPC, OBJECT_TYPE_PLACEABLE, "plc_weathmark", GetLocation(oFlame2), 0);
    CutCreateObject(0.0, oPC, OBJECT_TYPE_PLACEABLE, "plc_weathmark", GetLocation(oFlame3), 0);

    //CutApplyEffectToObject(1.5, DURATION_TYPE_INSTANT, VFX_COM_CHUNK_RED_MEDIUM, oCopy);
    CutApplyEffectToObject2(1.5, DURATION_TYPE_INSTANT, EffectDeath(), oCopy);
    object oDeekin;
    if(GetLocalInt(GetModule(), "X2_DEEKIN_ALIVE_AFTER_SIEGE") == 1)
    {
        oDeekin = GetObjectByTag("x2_hen_deekin");
        CutSetActiveCutsceneForObject(oDeekin, CUTSCENE_NUMBER);
    }
    if(oDeekin != OBJECT_INVALID && !GetIsDead(oDeekin))
    {
        //CutApplyEffectToObject(0.0, DURATION_TYPE_INSTANT, VFX_COM_CHUNK_RED_MEDIUM, oDeekin);
        CutApplyEffectToObject2(0.0, DURATION_TYPE_INSTANT, EffectDeath(), oDeekin);
    }
    CutSetCamera(2.0, oPC, CAMERA_MODE_TOP_DOWN, 280.0, 0.0, 60.0, CAMERA_TRANSITION_TYPE_SLOW);
    CutSetMusic(0.0, oPC, TRACK_THEME_ARIBETH2);
    CutPlaySound(0.0, oPC, "vs_nx2mephm_107");
    //CutPlayVoiceChat(0.0, oMeph, VOICE_CHAT_LAUGH);
    CutPlayAnimation2(0.0, oMeph, ANIMATION_FIREFORGET_STEAL, 2.0);
    CutPlayAnimation2(2.5, oMeph, ANIMATION_FIREFORGET_STEAL, 2.0);
    CutPlayAnimation2(2.5, oMeph, ANIMATION_FIREFORGET_STEAL, 2.0);
    CutPlaySound(1.0, oPC, "vs_nx2mephm_107");
    CutApplyEffectToObject(5.0, DURATION_TYPE_PERMANENT, VFX_DUR_PARALYZED, oCopy);
    CutApplyEffectToObject(5.0, DURATION_TYPE_INSTANT, VFX_IMP_RAISE_DEAD, oCopy);
    CutApplyEffectToObject(1.0, DURATION_TYPE_PERMANENT, VFX_DUR_CUTSCENE_INVISIBILITY, oCopy);
    CutStartNewModule(1.0, oPC);
    CutDisableCutscene(CUTSCENE_NUMBER, 3.0, 3.0);
}
