//::///////////////////////////////////////////////
//:: km_cutsctart2
//:: Copyright (c) 2004 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The Second opening cutscene, PC and henchmen
    are destroyed at the gates with the masked man
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: May 2004
//:://////////////////////////////////////////////
#include "x2_inc_cutscene"

void RemoveAllAssociates (object oMaster);
// Standard cutscene start. Best to wrap in a function in the event
// you need to do things before scene starts.
void StartCutscene(object oPC, int iCut);

void main()
{
    // Change to however you get the cutscene activator.
    object oPC = GetFirstPC();
    object oArea = GetArea(oPC);
    // Change to whatever cutscene number you want to use.
    int iCut = 10;

    if (GetIsPC(oPC))
    {
        SetLocalInt(GetModule(), "CUTSCENE_2", FALSE);

        // Immediately blacks out screen. Fade in when the scene starts.
        // BlackScreen(oPC);

        // Start the scene.
        AssignCommand(GetModule(), StartCutscene(oPC, iCut));
    }
}

void StartCutscene(object oPC, int iCut)
{
    // Setup the scene for the PC. Leave this alone.
    //CutSetActiveCutscene(iCut, CUT_DELAY_TYPE_CONSTANT);
    //CutSetActiveCutsceneForObject(oPC, iCut, TRUE);

    // Cutscene objects other than the PC. Define them, then set the cutscene as
    // active on them. This will allow them to be commanded using any cutscene functions
    // in the include.
    location lPCDead = GetLocation(GetObjectByTag("KMCUT3_STARTPC"));
    location lCalDead = GetLocation(GetObjectByTag("KMCUT3_STARTCAL"));
    location lJabDead = GetLocation(GetObjectByTag("KMCUT3_STARTJAB"));
    location lKaiDead = GetLocation(GetObjectByTag("KMCUT3_STARTKAI"));
    location lTrpDead = GetLocation(GetObjectByTag("KMCUT3_STARTTRP"));

    location lYennaSpwn = GetLocation(GetObjectByTag("KMCUT2_YENNASPWN"));
    location lYenna = GetLocation(GetObjectByTag("KMCUT2_YENNA"));
    location lTarget = GetLocation(GetObjectByTag("KMCUT2_TARGET"));

    object oYenna = CreateObject(OBJECT_TYPE_CREATURE, "km_yenna", lYennaSpwn);
    object oCal = GetObjectByTag("km_hen_cal");
    object oJab = GetObjectByTag("km_hen_jab");
    object oTrp = GetObjectByTag("km_hen_trp");
    object oKai = GetObjectByTag("km_hen_kai");

    object oLight = CreateObject(OBJECT_TYPE_PLACEABLE,"q3ai_mw_intro",lPCDead);
    object oMaskedM = GetObjectByTag("km_cutmasked");
    object oDylan = GetObjectByTag("kmcut_dylan");

    object oDrow1 = GetObjectByTag("q3_ddrow",0);
    object oDrow2 = GetObjectByTag("q3_ddrow",1);
    object oDrow3 = GetObjectByTag("q2_gatedrow",0);
    object oDrow4 = GetObjectByTag("q2_gatedrow",1);
    object oDrow5 = GetObjectByTag("q2_gatedrow",2);
    object oDrow6 = GetObjectByTag("q2_gatedrow",3);

    object oGuard1 = GetObjectByTag("KM_CUT1_GUARD",0);
    object oGuard2 = GetObjectByTag("KM_CUT1_GUARD",1);
    object oGuard3 = GetObjectByTag("KM_CUT1_GUARD",2);
    object oGuard4 = GetObjectByTag("KM_CUT1_GUARD",3);
    object oGuard5 = GetObjectByTag("KM_CUT1_GUARD",4);
    object oGuard6 = GetObjectByTag("KM_CUT1_GUARD",5);
    object oGuard7 = GetObjectByTag("KM_CUT1_GUARD",6);
    object oGuard8 = GetObjectByTag("KM_CUT1_GUARD",7);
    object oGuard9 = GetObjectByTag("KM_CUT1_GUARD",8);
    object oGuard10 = GetObjectByTag("KM_CUT1_GUARD",9);
    object oGuard11 = GetObjectByTag("KM_CUT1_GUARD",10);
    object oGuard12 = GetObjectByTag("KM_CUT1_GUARD",11);

    CutSetActiveCutsceneForObject(oLight, iCut);
    CutSetActiveCutsceneForObject(oYenna, iCut);

    // Create a PC Copy in the correct locations
    location lLoc = GetLocation(GetObjectByTag("KMCUT2_STARTCLONE"));
    object oPCCopy2 = CopyObject(oPC, lPCDead, OBJECT_INVALID,"KM_PC_COPY2");
    CutSetActiveCutsceneForObject(oPCCopy2, iCut);


    object oPCCopy = GetObjectByTag("KM_PC_COPY");

    /////////////////////////////////////////////////////////
    //Continue on with the rest of the cutscene.
    /////////////////////////////////////////////////////////

    CutSetCutsceneMode(0.5, oPC, TRUE, CUT_CAMERA_HEIGHT_HIGH, TRUE, 2);
    CutSetCamera(0.6, oPC, CAMERA_MODE_TOP_DOWN, 80.0, 16.0, 75.0,
        CAMERA_TRANSITION_TYPE_SNAP);

    //CutFadeFromBlack(2.5, oPC, FADE_SPEED_MEDIUM);

    CutPlayAnimation(1.0, oMaskedM, ANIMATION_LOOPING_CONJURE1, 10.0f);
    CutPlayAnimation(1.5, oPCCopy, ANIMATION_FIREFORGET_VICTORY2, 10.0f);

    CutPlayAnimation(1.6, oDrow1, ANIMATION_LOOPING_CONJURE1, 10.0f);
    CutPlayAnimation(1.7, oDrow2, ANIMATION_LOOPING_CONJURE2, 10.0f);
    CutPlayAnimation(1.8, oDrow4, ANIMATION_LOOPING_CONJURE1, 10.0f);

    CutPlayAnimation(1.6, oCal, ANIMATION_FIREFORGET_VICTORY1, 10.0f);
    CutPlayAnimation(1.7, oJab, ANIMATION_LOOPING_CONJURE2, 10.0f);
    CutPlayAnimation(1.8, oKai, ANIMATION_LOOPING_CONJURE2, 10.0f);

    CutApplyEffectAtLocation(2.7, oYenna, DURATION_TYPE_INSTANT, VFX_FNF_TIME_STOP, lTarget);

    CutApplyEffectToObject(3.0, DURATION_TYPE_TEMPORARY, VFX_DUR_FREEZE_ANIMATION, oPCCopy, 13.0f);
    CutApplyEffectToObject(3.0, DURATION_TYPE_TEMPORARY, VFX_DUR_FREEZE_ANIMATION, oMaskedM, 13.0f);
    CutApplyEffectToObject(3.0, DURATION_TYPE_TEMPORARY, VFX_DUR_FREEZE_ANIMATION, oDrow1, 13.0f);
    CutApplyEffectToObject(3.0, DURATION_TYPE_TEMPORARY, VFX_DUR_FREEZE_ANIMATION, oDrow2, 13.0f);
    CutApplyEffectToObject(3.0, DURATION_TYPE_TEMPORARY, VFX_DUR_FREEZE_ANIMATION, oDrow3, 13.0f);
    CutApplyEffectToObject(3.0, DURATION_TYPE_TEMPORARY, VFX_DUR_FREEZE_ANIMATION, oDrow4, 13.0f);
    CutApplyEffectToObject(3.0, DURATION_TYPE_TEMPORARY, VFX_DUR_FREEZE_ANIMATION, oDrow5, 13.0f);
    CutApplyEffectToObject(3.0, DURATION_TYPE_TEMPORARY, VFX_DUR_FREEZE_ANIMATION, oDrow6, 13.0f);
    CutApplyEffectToObject(3.0, DURATION_TYPE_TEMPORARY, VFX_DUR_FREEZE_ANIMATION, oCal, 13.0f);
    CutApplyEffectToObject(3.0, DURATION_TYPE_TEMPORARY, VFX_DUR_FREEZE_ANIMATION, oJab, 13.0f);
    CutApplyEffectToObject(3.0, DURATION_TYPE_TEMPORARY, VFX_DUR_FREEZE_ANIMATION, oTrp, 13.0f);
    CutApplyEffectToObject(3.0, DURATION_TYPE_TEMPORARY, VFX_DUR_FREEZE_ANIMATION, oKai, 13.0f);

    CutSetCamera(3.5, oPC, CAMERA_MODE_TOP_DOWN, 95.0, 21.0, 55.0,
        CAMERA_TRANSITION_TYPE_SLOW);

    CutApplyEffectToObject(4.5, DURATION_TYPE_TEMPORARY, VFX_DUR_LIGHT_WHITE_20, oYenna, 25.0f);
    CutApplyEffectAtLocation(4.5, oYenna, DURATION_TYPE_INSTANT, VFX_IMP_POLYMORPH, lYenna);
    CutJumpToLocation(5.0, oYenna, lYenna);

    CutSetFacingPoint (6.5, oDylan, "KMCUT2_YENNA");
    CutSpeakString (7.0, oDylan, "''Yenna! Thank the gods you've arrived!''");
    DelayCommand(7.0, SoundObjectPlay(GetObjectByTag("km1_dylan002")));

    CutSpeakString (11.0, oYenna, "''Stand back - I'll shield who I can.''");
    DelayCommand(11.0, SoundObjectPlay(GetObjectByTag("km1_yenna001")));

    CutPlayAnimation(12.0, oYenna, ANIMATION_LOOPING_CONJURE2, 12.5);

    CutApplyEffectToObject(12.0, DURATION_TYPE_TEMPORARY, VFX_DUR_GLOBE_INVULNERABILITY, oYenna, 15.0f);
    CutApplyEffectToObject(12.1, DURATION_TYPE_TEMPORARY, VFX_DUR_GLOBE_INVULNERABILITY, oDylan, 15.0f);
    CutApplyEffectToObject(12.2, DURATION_TYPE_TEMPORARY, VFX_DUR_GLOBE_INVULNERABILITY, oGuard1, 15.0f);
    CutApplyEffectToObject(12.3, DURATION_TYPE_TEMPORARY, VFX_DUR_GLOBE_INVULNERABILITY, oGuard2, 15.0f);
    CutApplyEffectToObject(12.4, DURATION_TYPE_TEMPORARY, VFX_DUR_GLOBE_INVULNERABILITY, oGuard3, 15.0f);
    CutApplyEffectToObject(12.5, DURATION_TYPE_TEMPORARY, VFX_DUR_GLOBE_INVULNERABILITY, oGuard4, 15.0f);
    CutApplyEffectToObject(12.6, DURATION_TYPE_TEMPORARY, VFX_DUR_GLOBE_INVULNERABILITY, oGuard5, 15.0f);
    CutApplyEffectToObject(12.7, DURATION_TYPE_TEMPORARY, VFX_DUR_GLOBE_INVULNERABILITY, oGuard6, 15.0f);
    CutApplyEffectToObject(12.8, DURATION_TYPE_TEMPORARY, VFX_DUR_GLOBE_INVULNERABILITY, oGuard7, 15.0f);
    CutApplyEffectToObject(12.9, DURATION_TYPE_TEMPORARY, VFX_DUR_GLOBE_INVULNERABILITY, oGuard8, 15.0f);
    CutApplyEffectToObject(12.0, DURATION_TYPE_TEMPORARY, VFX_DUR_GLOBE_INVULNERABILITY, oGuard9, 15.0f);
    CutApplyEffectToObject(12.1, DURATION_TYPE_TEMPORARY, VFX_DUR_GLOBE_INVULNERABILITY, oGuard10, 15.0f);
    CutApplyEffectToObject(12.2, DURATION_TYPE_TEMPORARY, VFX_DUR_GLOBE_INVULNERABILITY, oGuard11, 15.0f);
    CutApplyEffectToObject(12.3, DURATION_TYPE_TEMPORARY, VFX_DUR_GLOBE_INVULNERABILITY, oGuard12, 15.0f);

    CutApplyEffectToObject(13.0, DURATION_TYPE_INSTANT, VFX_FNF_DISPEL, oYenna);

    CutSpeakString (14.0, oDylan, "''Now, Yenna! Now!!''");
    DelayCommand(14.0, SoundObjectPlay(GetObjectByTag("km1_dylan003")));

    CutSetCamera(14.0, oPC, CAMERA_MODE_TOP_DOWN, 75.0, 11.0, 78.0,
        CAMERA_TRANSITION_TYPE_SLOW);

    CutApplyEffectAtLocation(16.0, oYenna, DURATION_TYPE_INSTANT, VFX_FNF_GREATER_RUIN, lTarget);
    CutApplyEffectAtLocation(16.5, oYenna, DURATION_TYPE_INSTANT, VFX_FNF_WORD, lTarget);
    CutApplyEffectAtLocation(17.0, oYenna, DURATION_TYPE_INSTANT, VFX_FNF_MYSTICAL_EXPLOSION, lTarget);
    //CutActionCastFakeSpellAtLocation( 22.0, SPELL_EPIC_RUIN, oYenna, lTarget);

    CutPlayAnimation(17.1, oPCCopy, ANIMATION_LOOPING_DEAD_BACK, 15.0f);
    CutPlayAnimation(17.1, oMaskedM, ANIMATION_LOOPING_DEAD_BACK, 15.0f);

    CutPlayAnimation(17.0, oPC, ANIMATION_LOOPING_DEAD_BACK, 15.0f);

    CutPlayAnimation(17.3, oCal, ANIMATION_LOOPING_DEAD_BACK, 15.0f);
    CutPlayAnimation(17.4, oJab, ANIMATION_LOOPING_DEAD_BACK, 15.0f);
    CutPlayAnimation(17.5, oTrp, ANIMATION_LOOPING_DEAD_BACK, 15.0f);
    CutPlayAnimation(17.6, oKai, ANIMATION_LOOPING_DEAD_BACK, 15.0f);

    CutPlayAnimation(17.3, oDrow1, ANIMATION_LOOPING_DEAD_BACK, 15.0f);
    CutPlayAnimation(17.4, oDrow2, ANIMATION_LOOPING_DEAD_BACK, 15.0f);
    CutPlayAnimation(17.5, oDrow3, ANIMATION_LOOPING_DEAD_BACK, 15.0f);
    CutPlayAnimation(17.6, oDrow4, ANIMATION_LOOPING_DEAD_BACK, 15.0f);
    CutPlayAnimation(17.7, oDrow5, ANIMATION_LOOPING_DEAD_BACK, 15.0f);
    CutPlayAnimation(17.8, oDrow6, ANIMATION_LOOPING_DEAD_BACK, 15.0f);

    CutFadeToBlack(19.0, oPC);

    CutClearAllActions(19.5, oPC, TRUE);
    CutJumpToLocation(19.5, oPCCopy2, lPCDead);
    DelayCommand( 19.5, SetXP(oPC, 2100));
    CutJumpToLocation(20.0, oPC, lPCDead);

    CutClearAllActions(20.0, oCal, TRUE);
    CutJumpToLocation(20.5, oCal, lCalDead);
    CutClearAllActions(20.0, oJab, TRUE);
    CutJumpToLocation(20.5, oJab, lJabDead);
    CutClearAllActions(20.0, oKai, TRUE);
    CutJumpToLocation(20.5, oKai, lKaiDead);
    CutClearAllActions(20.0, oTrp, TRUE);
    CutJumpToLocation(20.5, oTrp, lTrpDead);

    CutPlayAnimation(21.0, oPC, ANIMATION_LOOPING_DEAD_BACK, 15.0f);
    CutPlayAnimation(21.0, oPCCopy2, ANIMATION_LOOPING_DEAD_BACK, 15.0f);

    CutDeath(22.0, oCal, TRUE);
    CutDeath(22.0, oJab, TRUE);
    CutDeath(22.0, oTrp, TRUE);
    CutDeath(22.0, oKai, TRUE);

    CutFadeFromBlack(26.0, oPC);

    DelayCommand(27.5, SoundObjectPlay(GetObjectByTag("km1_weapon019")));
    CutSpeakString(27.5, oLight, "''Wake up...''");
    CutSpeakString(29.5, oLight, "''Oh, don't be such a nuisance!''");
    CutSpeakString(31.5, oLight, "''It's time you wake up.''");
    CutDestroyPCCopy(33.7, oPC, FALSE);
    CutDestroyObject(33.7, oPCCopy2);

    DelayCommand(34.0, SoundObjectStop(GetObjectByTag("km1_weapon019")));
    DelayCommand(34.0, SetLocalInt(GetModule(), "CUTSCENE_2", FALSE));
    DelayCommand(34.0, ForceRest(oPC));
    DelayCommand(34.0, SetMaxHenchmen(2));

    DelayCommand(34.0, CutSetActiveCutscene(-1, CUT_DELAY_TYPE_CONSTANT));
    DelayCommand(34.7, AssignCommand(oLight, ActionStartConversation(oPC)));
}
