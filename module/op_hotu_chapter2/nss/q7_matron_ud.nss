//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Matron's user defined events
*/

// on her death, the following cutscene is fires:
// - With a series of explosions and roaring, Meph gets out of his confinment.
// - Meph jumps in the air and lands on the platform, towering over the player.
// - Meph inits dialog with the pc.
// - Meph throws the player into hell.

#include "x2_inc_cutscene"
#include "nw_i0_generic"
#include "x0_inc_portal"

int CUTSCENE_NUMBER = 72;
object oMeph; // used globally because the original object is replaced by a delay-created object

void CallPlayAnimation2(int nCutscene, object oObject, int nAnimation, float fLength)
{
    if(nCutscene == GetLocalInt(oObject, "nCutsceneNumber"))
    {
        AssignCommand(oObject, PlayAnimation(nAnimation, 0.7, fLength));
    }
}

void CutPlayAnimation2(float fDelay, object oObject, int nAnimation, float fLength, int iShift = TRUE)
{
    int nCutscene = GetActiveCutsceneNum();
    fDelay = CutCalculateCurrentDelay(fDelay, nCutscene);
    DelayCommand(fDelay, DelayCommand(GetShift(oObject, iShift), CallPlayAnimation(nCutscene, oObject, nAnimation, fLength)));
}


void CallBringMeph(int nCutscene, object oPC, location lLoc)
{
    if(nCutscene == GetLocalInt(oPC, "nCutsceneNumber"))
    {
         oMeph = CreateObject(OBJECT_TYPE_CREATURE, "q7_meph", lLoc, TRUE);
         CutSetActiveCutsceneForObject(oMeph, nCutscene);

    }

}

void CutBringMeph(float fDelay, object oPC, location lLoc)
{
    int nCutscene = GetActiveCutsceneNum();
    fDelay = CutCalculateCurrentDelay(fDelay, nCutscene);
    DelayCommand(fDelay, CallBringMeph(nCutscene, oPC, lLoc));
}

void RemoveEffects2(object oObject)
{
    effect eEff = GetFirstEffect(oObject);
    while(GetIsEffectValid(eEff))
    {
        RemoveEffect(oObject, eEff);
        eEff = GetNextEffect(oObject);
    }
}

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


void StartCutscene(object oPC)
{
    object oCamera1a = GetWaypointByTag("q7b_wp_camera1");
    oMeph = GetObjectByTag("q7_meph");
    object oZap1 = GetObjectByTag("q7_zap1");
    object oZap2 = GetObjectByTag("q7_zap2");
    object oZap3 = GetObjectByTag("q7_zap3");
    object oZap4 = GetObjectByTag("q7_zap4");
    object oZap5 = GetObjectByTag("q7_zap5");
    object oZap6 = GetObjectByTag("q7_zap6");
    object oZap7 = GetObjectByTag("q7_zap7");
    object oZap8 = GetObjectByTag("q7_zap8");
    object oCamera1 = GetObjectByTag("q7b3_wp_camera1");
    object oCamera2 = GetObjectByTag("q7b3_wp_camera2");
    object oPCStand = GetWaypointByTag("q7b3_wp_pc_walk");
    object oMephJump = GetWaypointByTag("q7b_wp_meph_jump");
    object oFireSound = GetObjectByTag("q7_fire_sound");
    object oHiddenWP = GetWaypointByTag("q7b_wp_temp_copy");
    object oDeekinStand = GetWaypointByTag("q7b3_wp_deekin_walk");
    SoundObjectStop(oFireSound);
    DestroyObject(oFireSound);

    effect eGhost = EffectCutsceneGhost();
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGhost, oMeph); // so he won't bump to any nearby creature
    CutSetActiveCutscene(CUTSCENE_NUMBER, CUT_DELAY_TYPE_CUMULATIVE);
    CutSetActiveCutsceneForObject(oPC, CUTSCENE_NUMBER, TRUE);
    CutSetActiveCutsceneForObject(oMeph, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oZap1, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oZap2, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oZap3, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oZap4, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oZap5, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oZap6, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oZap7, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oZap8, CUTSCENE_NUMBER);
    effect eBeam1 = EffectBeam(VFX_BEAM_LIGHTNING, oZap1, BODY_NODE_CHEST);
    effect eBeam2 = EffectBeam(VFX_BEAM_LIGHTNING, oZap3, BODY_NODE_CHEST);
    effect eBeam3 = EffectBeam(VFX_BEAM_LIGHTNING, oZap4, BODY_NODE_CHEST);
    effect eBeam4 = EffectBeam(VFX_BEAM_LIGHTNING, oZap2, BODY_NODE_CHEST);
    effect eBeam5 = EffectBeam(VFX_BEAM_LIGHTNING, oZap5, BODY_NODE_CHEST);
    effect eBeam6 = EffectBeam(VFX_BEAM_LIGHTNING, oZap7, BODY_NODE_CHEST);
    effect eBeam7 = EffectBeam(VFX_BEAM_LIGHTNING, oZap8, BODY_NODE_CHEST);
    object oDeekin;
    if(GetLocalInt(GetModule(), "X2_DEEKIN_ALIVE_AFTER_SIEGE") == 1)
    {
        oDeekin = GetObjectByTag("x2_hen_deekin");
        CutSetActiveCutsceneForObject(oDeekin, CUTSCENE_NUMBER);
        RemoveHenchman(oPC, oDeekin);
    }

    object oCopy = CutCreatePCCopy(oPC, GetLocation(oHiddenWP), "q7b3_pc_copy");
    RemoveEffects2(oCopy);
    RemoveAOE();
    AssignCommand(oCopy, SetIsDestroyable(FALSE));
    CutSetCutsceneMode(1.0, oPC, TRUE, CUT_CAMERA_HEIGHT_MEDIUM, FALSE, TRUE);
    CutFadeOutAndIn(0.0, oPC, 3.0);
    CutSetCamera(2.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 0.0, 100.0, CAMERA_TRANSITION_TYPE_SNAP);
    CutJumpToObject(0.0, oPC, oCamera1);
    CutJumpToObject(0.0, oCopy, oPCStand);
    if(oDeekin != OBJECT_INVALID && !GetIsDead(oDeekin))
        CutJumpToObject(0.0, oDeekin, oDeekinStand);

    CutPlaySound(0.0, oPC, "c_devil_bat1");
    CutPlayAnimation(1.0, oMeph, ANIMATION_LOOPING_SPASM, 3.0);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 10.0, 100.0, CAMERA_TRANSITION_TYPE_MEDIUM);
    CutSetCameraSpeed(0.0, oPC, 0.2);
    CutPlaySound(0.0, oPC, "c_devil_bat1");
    CutActionMoveToObject(0.0, oPC, oCamera2, FALSE);
    CutApplyEffectToObject2(0.3, DURATION_TYPE_TEMPORARY, eBeam1, oZap4, 0.5);
    CutApplyEffectToObject2(0.3, DURATION_TYPE_TEMPORARY, eBeam2, oZap2, 0.5);
    CutApplyEffectToObject2(0.3, DURATION_TYPE_TEMPORARY, eBeam3, oZap7, 0.5);
    CutApplyEffectToObject2(0.3, DURATION_TYPE_TEMPORARY, eBeam4, oZap7, 0.5);
    CutApplyEffectToObject2(0.3, DURATION_TYPE_TEMPORARY, eBeam5, oZap2, 0.5);
    CutPlaySound(0.0, oPC, "c_devil_atk3");
    CutApplyEffectToObject2(0.3, DURATION_TYPE_TEMPORARY, eBeam6, oZap2, 0.5);
    CutApplyEffectToObject2(0.3, DURATION_TYPE_TEMPORARY, eBeam7, oZap3, 0.5);
    CutApplyEffectToObject2(0.3, DURATION_TYPE_TEMPORARY, eBeam1, oZap4, 0.5);
    CutApplyEffectToObject2(0.3, DURATION_TYPE_TEMPORARY, eBeam2, oZap2, 0.5);
    CutApplyEffectToObject2(0.3, DURATION_TYPE_TEMPORARY, eBeam3, oZap7, 0.5);
    CutPlaySound(0.0, oPC, "c_devil_atk2");
    CutApplyEffectToObject2(0.3, DURATION_TYPE_TEMPORARY, eBeam4, oZap5, 0.5);
    CutApplyEffectToObject(0.0, DURATION_TYPE_INSTANT, 459, oMeph);
    CutPlaySound(0.0, oPC, "sff_explfire");
    //CutApplyEffectToObject2(0.0, DURATION_TYPE_TEMPORARY, EffectDisappearAppear(GetLocation(oMephJump)), oMeph, 2.5);
    CutSetPlotFlag(0.0, oMeph, FALSE);
    CutApplyEffectToObject2(0.1, DURATION_TYPE_PERMANENT, EffectDisappear(), oMeph);
    CutBringMeph(1.5, oPC, GetLocation(oMephJump));
    // meph lands infront of the player
    // cutscene continues on meph's spawn script: q7_meph_sp


}

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {

    }
    else if(nUser == 1002) // PERCEIVE
    {

    }
    else if(nUser == 1003) // END OF COMBAT
    {
        int nRand = d20(1);
        int nVoice = -1;
        if(nRand == 1) nVoice = VOICE_CHAT_BATTLECRY1;
        else if(nRand == 2) nVoice = VOICE_CHAT_BATTLECRY2;
        else if(nRand == 3) nVoice = VOICE_CHAT_BATTLECRY3;
        else if(nRand == 4) nVoice = VOICE_CHAT_TAUNT;
        else if(nRand == 5) nVoice = VOICE_CHAT_THREATEN;

        if(nVoice != -1)
            PlayVoiceChat(nVoice);
    }
    else if(nUser == 1004) // ON DIALOGUE
    {

    }
    else if(nUser == 1005) // ATTACKED
    {

    }
    else if(nUser == 1006) // DAMAGED
    {

    }
    else if(nUser == 1007) // DEATH
    {
        int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_DEATH_ONCE");
        if(nDoOnce == 1)
            return;
        SetLocalInt(OBJECT_SELF, "DO_DEATH_ONCE", 1);

        object oPC = GetLastKiller();
        if(oPC == OBJECT_INVALID || !GetIsPC(oPC))
            oPC = GetMaster(GetLastKiller());
        if(oPC == OBJECT_INVALID)
            oPC = GetFirstPC();
        SetLocalObject(GetArea(OBJECT_SELF), "Q7_MAIN_CUTSCENE_PC", oPC);
        SetPlotFlag(oPC, TRUE); // so he won't be killed by lingering spells
        StartCutscene(oPC);

    }
    else if(nUser == 1008) // DISTURBED
    {

    }
    else if(nUser == 101) // buff and remove bindings
    {
        int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_BUFF_ONCE");
        if(nDoOnce == 1)
            return;
        SetLocalInt(OBJECT_SELF, "DO_BUFF_ONCE", 1);

        ClearAllActions();
        ActionCastSpellAtObject(SPELL_FREEDOM_OF_MOVEMENT, OBJECT_SELF, METAMAGIC_NONE, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
        ActionCastSpellAtObject(SPELL_ENERGY_BUFFER, OBJECT_SELF, METAMAGIC_NONE, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
        ActionCastSpellAtObject(SPELL_OWLS_WISDOM, OBJECT_SELF, METAMAGIC_NONE, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
        ActionCastSpellAtObject(SPELL_BULLS_STRENGTH, OBJECT_SELF, METAMAGIC_NONE, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
        ActionCastSpellAtObject(SPELL_ENDURANCE, OBJECT_SELF, METAMAGIC_NONE, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
        DelayCommand(3.0, DetermineCombatRound());

        // Remove reaper binding
        object oTempleTrig = GetObjectByTag("x2_reap_trig0");
        DestroyObject(oTempleTrig); // removes temple binding

        // remove reaper bindings:
        int i;
        object oAnchor;
        for(i = 1; i <= 5; i++)
        {
           oAnchor = PortalGetAnchor(i, GetFirstPC());
           if(oAnchor != OBJECT_INVALID)
           {
               PortalDeleteAnchor(i, GetFirstPC());
           }
        }
    }

}

