//::///////////////////////////////////////////////
//:: Name hx_ari_change_g
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Evil Aribeth gets shifted to good.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void ChangeSword(object oWeapon);
void main()
{
      object oPC = GetPCSpeaker();
      object oAribeth = GetObjectByTag("H2_Aribeth");
      object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oAribeth);

      // Shift alignments.
      AdjustAlignment(oAribeth, ALIGNMENT_LAWFUL, 100);
      AdjustAlignment(oAribeth, ALIGNMENT_GOOD, 100);

      AdjustAlignment(oPC, ALIGNMENT_GOOD, 5);

      DelayCommand(1.3, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_STRIKE_HOLY), oAribeth));

      if(GetIsObjectValid(oWeapon))
      {
          PlayAnimation(ANIMATION_FIREFORGET_VICTORY1, 1.0, 3.0);
          DelayCommand(0.7, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_FREEZE_ANIMATION), oAribeth, 4.5));
          DelayCommand(2.0, ChangeSword(oWeapon));
      }

      //Journal Entry
      AddJournalQuestEntry("XP2_Name_Aribeth", 50, oPC, TRUE, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 145;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }
}

// Add vfx to Aribeth's sword.
void ChangeSword(object oWeapon)
{
    AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyVisualEffect(ITEM_VISUAL_HOLY), oWeapon);
}
