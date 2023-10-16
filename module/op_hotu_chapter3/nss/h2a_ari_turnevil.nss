//::///////////////////////////////////////////////
//:: Aribeth, Turn Evil (Action Script)
//:: H2a_Ari_TurnEvil.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Mini-cutscene where Aribeth becomes evil.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Edited By: Brad Prince
//::            Added the cutscene.
//:: Created On: August 20, 2003
//:://////////////////////////////////////////////
#include "x2_inc_cutscene"
#include "nw_i0_plot"
// Standard cutscene start
void StartCutscene(object oPC, int iCut);
// Add vfx to Aribeth's sword.
void ChangeSword(int iCut, object oAribeth, object oWeapon);
// Nuke Aribeth.
void DestroyAribeth(object oAribeth);

void main()
{
    //Mini cutscene where she holds her sword aloft and it has unholy VFX applied.
    //In the resulting flash, swap out her model for the evil variant.
    //
    //
    int iCut = 400;
    //Change Aribeth's Alignment
    //AdjustAlignment(OBJECT_SELF, ALIGNMENT_CHAOTIC, 100);
    //AdjustAlignment(OBJECT_SELF, ALIGNMENT_EVIL, 100);

    //Give the PC a major Evil hit
    object oPC = GetPCSpeaker();
    BlackScreen(oPC);
    AdjustAlignment(oPC, ALIGNMENT_EVIL, 10);

    //Add journal entry
    AddJournalQuestEntry("XP2_Aribeth", 100, oPC, TRUE, TRUE);

     //Give non-repeatable XP
    int i2daRow = 68;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }

    StartCutscene(oPC, iCut);
}

void StartCutscene(object oPC, int iCut)
{
      CutDisableAbort(iCut);

      // Cutscene objects other than the PC.
      object oAribeth = GetNearestObjectByTag("H2_Aribeth", oPC);
      CutSetActiveCutsceneForObject(oAribeth, iCut);
      ChangeToStandardFaction(oAribeth, STANDARD_FACTION_COMMONER);
      object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oAribeth);
      CutSetActiveCutsceneForObject(oWeapon, iCut);

      location lAribethJump = GetLocation(GetObjectByTag("hx_aribeth_jump_wp"));
      location lSave = GetLocation(oAribeth);

      // Setup the scene
      CutSetActiveCutscene(iCut, CUT_DELAY_TYPE_CONSTANT);
      CutSetActiveCutsceneForObject(oPC, iCut, TRUE);
      CutSetCutsceneMode(1.1, oPC, TRUE, CUT_CAMERA_HEIGHT_MEDIUM, TRUE);
      CutSetCamera(1.9, oPC, CAMERA_MODE_TOP_DOWN, 360.0, 3.0, 100.0,
                   CAMERA_TRANSITION_TYPE_SNAP);
      CutSetLocation(0.2, oPC);
      CutJumpToLocation(1.8, oPC, lAribethJump);
      CutJumpToLocation(1.8, oAribeth, lAribethJump);
      CutFadeFromBlack(2.2, oPC, FADE_SPEED_MEDIUM);

      // Start cutscene.
      CutSetCamera(2.2, oPC, CAMERA_MODE_TOP_DOWN, 360.0, 2.0, 55.0,
                   CAMERA_TRANSITION_TYPE_VERY_SLOW);
      CutPlayAnimation(4.0, oAribeth, ANIMATION_FIREFORGET_VICTORY1, 3.0);
      CutApplyEffectToObject(4.7, DURATION_TYPE_TEMPORARY, VFX_DUR_FREEZE_ANIMATION, oAribeth, 4.5);
      CutApplyEffectToObject(5.3, DURATION_TYPE_INSTANT, VFX_IMP_HARM, oAribeth);
      DelayCommand(6.0, ChangeSword(iCut, oAribeth, oWeapon));

      // End scene.
      CutFadeOutAndIn(10.0, oPC, 1.5);
      CutCreateObject(10.5, oPC, OBJECT_TYPE_CREATURE, "hx_aribeth_evil", lSave, EFFECT_TYPE_INVALIDEFFECT);
      CutApplyEffectToObject(11.6, DURATION_TYPE_PERMANENT, VFX_DUR_CUTSCENE_INVISIBILITY, oAribeth);
      CutDisableCutscene(iCut, 11.0, 11.0, RESTORE_TYPE_NORMAL);
      DelayCommand(12.5, DestroyAribeth(oAribeth));
}

// Add vfx to Aribeth's sword.
void ChangeSword(int iCut, object oAribeth, object oWeapon)
{
    if(iCut == GetLocalInt(oAribeth, "nCutsceneNumber"))
    {
        AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyVisualEffect(ITEM_VISUAL_EVIL), oWeapon);
    }
}

// Nuke Aribeth.
void DestroyAribeth(object oAribeth)
{
    AssignCommand(oAribeth, SetIsDestroyable(TRUE, FALSE, FALSE));

    if(GetPlotFlag(oAribeth) == TRUE)
    {
        SetPlotFlag(oAribeth, FALSE);
    }
    if(GetImmortal(oAribeth) == TRUE)
    {
        SetImmortal(oAribeth, FALSE);
    }
    DelayCommand(0.2, DestroyObject(oAribeth));
}
