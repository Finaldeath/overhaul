// Devil's army appearance cutscene:
// lots of weak devils appear
// big devil dude appears behind them
// big devil passes through them and orders them to attack the player
// the weak devils say the player is strong etc' etc'
// the big devil threatens them
// the weak devils charge.

// Edited By: Brad Prince - changed cameras. Added destroy function for Blood War
// folks.

int CUTSCENE_NUMBER = 777;

#include "x2_inc_cutscene"

void CallSetLocalInt(int nCutscene, object oObject, string sName, int nVal)
{
    if(nCutscene == GetLocalInt(oObject, "nCutsceneNumber"))
    {
        SetLocalInt(GetArea(oObject), "DELAY_STATRED", 1); // used for savegame detection
        DelayCommand(10.0, SetLocalInt(GetArea(oObject), sName, nVal));
    }
}

void CutSetLocalInt(float fDelay, object oObject, string sName, int nVal)
{
    int nCutscene = GetActiveCutsceneNum();
    fDelay = CutCalculateCurrentDelay(fDelay, nCutscene);
    DelayCommand(fDelay, CallSetLocalInt(nCutscene, oObject, sName, nVal));
}

void CallActionMoveToObject2(int nCutscene, object oPC, string sTag)
{
    if(nCutscene == GetLocalInt(oPC, "nCutsceneNumber"))
    {
         object oWP = GetNearestObjectByTag(sTag, oPC);
         AssignCommand(oPC, ActionMoveToObject(oWP, TRUE));
    }
}

void CutActionMoveToObject2(float fDelay, object oPC, string sTag)
{
    int nCutscene = GetActiveCutsceneNum();
    fDelay = CutCalculateCurrentDelay(fDelay, nCutscene);
    DelayCommand(fDelay, CallActionMoveToObject2(nCutscene, oPC, sTag));
}

void KillBloodWar(object oPC)
{
    object oPortal1 = GetObjectByTag("hx_devil_portal");
    object oPortal2 = GetObjectByTag("hx_demon_portal");
    int x = 1;

    object oCreature = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, oPC, x);

    SetPlotFlag(oPortal1, FALSE);
    SetPlotFlag(oPortal2, FALSE);

    DestroyObject(oPortal1);
    DestroyObject(oPortal2);

    while(GetIsObjectValid(oCreature))
    {
        DestroyObject(oCreature);
        x = x + 1;
        oCreature = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, oPC, x);
    }
}

void CallSetFacingPoint2(int nCutscene, object oPC, object oFaceTo)
{
    if(nCutscene == GetLocalInt(oPC, "nCutsceneNumber"))
    {
        AssignCommand(oPC, SetFacingPoint(GetPosition(oFaceTo)));
    }
}

void CutSetFacingPoint2(float fDelay, object oPC, object oFaceTo, int iShift = TRUE)
{
    int nCutscene = GetActiveCutsceneNum();
    fDelay = CutCalculateCurrentDelay(fDelay, nCutscene);
    DelayCommand(fDelay, DelayCommand(GetShift(oPC, iShift), CallSetFacingPoint2(nCutscene, oPC, oFaceTo)));
}

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_CUTSCENE_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_CUTSCENE_ONCE", 1);

    // Brad Prince
    KillBloodWar(oPC);

    SetCustomToken(77777, GetName(oPC));
    SetLocalInt(GetArea(OBJECT_SELF), "YJ_TOTAL_CREATED", 12);
    SetLocalInt(GetArea(OBJECT_SELF), "YJ_DEVILS_SCREEN_COUNT", 12);
    object oCamera1 = GetWaypointByTag("yj_wp_camera1");
    object oPitFiendSP = GetWaypointByTag("yj_wp_pitfiend_sp");
    object oPitFiend = GetObjectByTag("yj_pitfiend");
    object oCopySP = GetWaypointByTag("yj_wp_copy_sp");
    object oPitFiendWalk = GetWaypointByTag("yj_wp_pitfiend_walk");
    object oPitFiendReturn = GetWaypointByTag("yj_wp_devil_return");
    object oWPCharge;


    CutSetActiveCutscene(CUTSCENE_NUMBER, CUT_DELAY_TYPE_CUMULATIVE);
    CutSetActiveCutsceneForObject(oPC, CUTSCENE_NUMBER, TRUE);
    CutSetActiveCutsceneForObject(oPitFiend, CUTSCENE_NUMBER);

    CutFadeOutAndIn(0.0, oPC, 3.0);
    CutSetLocation(0.0, oPC);
    object oCopy = CutCreatePCCopy(oPC, GetLocation(oCopySP), "yj_pc_copy");
    CutSetCutsceneMode(1.0, oPC, TRUE, CUT_CAMERA_HEIGHT_MEDIUM, TRUE, TRUE);
    CutJumpToObject(0.5, oCopy, oPC);
    CutJumpToObject(0.5, oPC, oCamera1);
    CutSetCamera(0.5, oPC, CAMERA_MODE_TOP_DOWN, 160.0, 16.0, 70.0, CAMERA_TRANSITION_TYPE_SNAP);
    CutSetCamera(0.2, oPC, CAMERA_MODE_TOP_DOWN, 150.0, 5.0, 85.0, CAMERA_TRANSITION_TYPE_SLOW);
    CutSetCamera(0.2, oPC, CAMERA_MODE_TOP_DOWN, 150.0, 5.0, 85.0, CAMERA_TRANSITION_TYPE_SLOW);

    // Bring in all the devil warriors
    int i = 1;
    float fDif = 0.05;
    object oDevil;
    object oCurrentWP = GetNearestObjectByTag("yj_wp_devil_sp", oPC, i);
    object oCurrentDevil = GetNearestObjectByTag("yj_devil", oPC, i);
    oDevil = oCurrentDevil;
    while(oCurrentDevil != OBJECT_INVALID)
    {
        CutSetActiveCutsceneForObject(oCurrentDevil, CUTSCENE_NUMBER);
        CutApplyEffectAtLocation(0.5 - fDif, oPC, DURATION_TYPE_INSTANT, VFX_IMP_HARM, GetLocation(oCurrentWP)); // was 471
        CutJumpToObject(0.3, oCurrentDevil, oCurrentWP);
        i++;
        fDif += 0.05;
        oCurrentWP = GetNearestObjectByTag("yj_wp_devil_sp", oPC, i);
        oCurrentDevil = GetNearestObjectByTag("yj_devil", oPC, i);
    }
    CutSetCamera(4.0, oPC, CAMERA_MODE_TOP_DOWN, 150.0, 1.0, 90.0, CAMERA_TRANSITION_TYPE_VERY_FAST);
    CutSetCamera(3.0, oPC, CAMERA_MODE_TOP_DOWN, 150.0, 3.0, 90.0, CAMERA_TRANSITION_TYPE_SLOW);
    // bring in the big guy
    location lLoc;
    vector vPos = GetPosition(oPitFiendSP);
    float fDelay = 0.08;
    for(i = 1; i <= 26; i++)
    {
        vPos.z += 0.3;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, 0.0);
        if(i == 5)
        {
            CutJumpToObject(0.0, oPitFiend, oPitFiendSP);
        }
        CutApplyEffectAtLocation(fDelay, oPC, DURATION_TYPE_INSTANT, VFX_FNF_LOS_EVIL_20, lLoc);
        //fDelay += 0.08;
    }
    CutPlaySound(1.2, oPC, "c_devil_bat1");
    CutPlayAnimation(0.2, oPitFiend, ANIMATION_FIREFORGET_TAUNT, 0.0);
    //CutApplyEffectAtLocation(1.5, oPC, DURATION_TYPE_INSTANT, VFX_IMP_HARM, GetLocation(oPitFiendSP));
    CutActionMoveToObject(1.0, oPitFiend, oPitFiendWalk, FALSE);
    CutActionStartConversation(5.0, oPitFiend, oPitFiend, "yj_cut1");
    CutSetFacingPoint2(3.0, oDevil, oPitFiend);
    CutActionStartConversation(0.0, oDevil, oDevil, "yj_cut2");
    CutSetFacingPoint2(3.0, oPitFiend, oDevil);
    CutActionStartConversation(0.0, oPitFiend, oPitFiend, "yj_cut3");
    CutPlayAnimation(3.0, oPitFiend, ANIMATION_LOOPING_TALK_PLEADING, 2.0);
    CutActionStartConversation(0.0, oDevil, oDevil, "yj_cut4");
    CutSetCamera(3.0, oPC, CAMERA_MODE_TOP_DOWN, 150.0, 8.0, 90.0, CAMERA_TRANSITION_TYPE_SLOW);
    vPos = GetPosition(oPitFiendWalk);
    for(i = 1; i <= 26; i++)
    {
        vPos.z += 0.3;
        if(i == 5)
        {
             CutJumpToObject(0.0, oPitFiend, oPitFiendReturn);
        }
        lLoc = Location(GetArea(OBJECT_SELF), vPos, 0.0);
        CutApplyEffectAtLocation(fDelay, oPC, DURATION_TYPE_INSTANT, VFX_FNF_LOS_EVIL_10, lLoc);
        //fDelay += 0.08;
    }
    //CutApplyEffectToObject(3.0, DURATION_TYPE_INSTANT, VFX_IMP_HARM, oPitFiend); // was 472

    CutSetMusic(0.0, oPC, 72);
    // charge the player
    i = 1;
    oCurrentDevil = GetNearestObjectByTag("yj_devil", oPC, i);
    while(oCurrentDevil != OBJECT_INVALID)
    {

        if((i % 2) == 0)
        {
            CutPlayAnimation(0.3, oCurrentDevil, ANIMATION_FIREFORGET_TAUNT, 0.0);
            CutPlayVoiceChat(0.0, oCurrentDevil, VOICE_CHAT_BATTLECRY1);
        }
        else if((i % 3) == 0)
        {
            CutPlayAnimation(0.3, oCurrentDevil, ANIMATION_FIREFORGET_VICTORY1, 0.0);
            CutPlayVoiceChat(0.0, oCurrentDevil, VOICE_CHAT_BATTLECRY2);
        }
        else if((i % 5) == 0)
        {
            CutPlayAnimation(0.3, oCurrentDevil, ANIMATION_FIREFORGET_VICTORY2, 0.0);
            CutPlayVoiceChat(0.0, oCurrentDevil, VOICE_CHAT_BATTLECRY3);
        }
        CutActionMoveToObject2(0.1, oCurrentDevil, "yj_wp_devil_run");
        i++;
        oCurrentDevil = GetNearestObjectByTag("yj_devil", oPC, i);
    }
    CutSetLocalInt(0.0, oPC, "YJ_FIGHT_STARTED", 1);
    CutFadeOutAndIn(0.0, oPC, 4.0);
    CutJumpToObject(1.5, oPC, oCopy);
    CutAdjustReputation(1.0, oPitFiend, oPC, -100);
    CutAdjustReputation(0.0, oPC, oPitFiend, -100);
    CutDisableCutscene(CUTSCENE_NUMBER, 0.0, 0.0);

}
