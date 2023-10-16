// Shdow-device altar: remove black pearl and give a new power for held weapon.

#include "x2_inc_itemprop"
#include "nw_i0_plot"

void RemoveEffects2(object oObject)
{
    effect e = GetFirstEffect(oObject);
    while(GetIsEffectValid(e))
    {
        RemoveEffect(oObject, e);
        e = GetNextEffect(oObject);
    }
}

void main()
{
    object oPC = GetPCSpeaker();

    object oGem = GetLocalObject(OBJECT_SELF, "GEM");
    int nStack = GetItemStackSize(oGem);
    if(oGem == OBJECT_INVALID)
        return;
    object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
    int nType = GetBaseItemType(oWeapon);
    // if the held item is not a weapon then do nothing
    if(oWeapon == OBJECT_INVALID || !IPGetIsMeleeWeapon(oWeapon))
        return;

    Reward_2daXP(oPC, 19);
    AssignCommand(oPC, ActionPauseConversation());
    DelayCommand(4.0, AssignCommand(oPC, ActionResumeConversation()));
    // Destroy the gem
    if(nStack == 1)
        DestroyObject(oGem);
    else if(nStack > 1)
    {
        nStack--;
        SetItemStackSize(oGem, nStack);
    }

    object oWP1 = GetNearestObjectByTag("q3b_wp_breather1");
    object oWP2 = GetNearestObjectByTag("q3b_wp_breather2");
    object oBreather1 = CreateObject(OBJECT_TYPE_CREATURE, "q3b_breather", GetLocation(oWP1), FALSE, "q3b_statue1");
    object oBreather2 = CreateObject(OBJECT_TYPE_CREATURE, "q3b_breather", GetLocation(oWP2), FALSE, "q3b_statue2");

    effect eGhost = EffectCutsceneGhost();
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGhost, oBreather1);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGhost, oBreather2);

    AssignCommand(oBreather1, ActionCastFakeSpellAtObject(SPELLABILITY_GOLEM_BREATH_GAS, OBJECT_SELF));
    AssignCommand(oBreather2, ActionCastFakeSpellAtObject(SPELLABILITY_GOLEM_BREATH_GAS, OBJECT_SELF));
    DestroyObject(oBreather1, 3.0);
    DestroyObject(oBreather2, 3.0);
    // Apply the new effect
    // TODO: add visual effect
    itemproperty ipVis = ItemPropertyVisualEffect(ITEM_VISUAL_EVIL);
    itemproperty ipAb = ItemPropertyOnHitProps(IP_CONST_ONHIT_ABILITYDRAIN, IP_CONST_ONHIT_SAVEDC_24, IP_CONST_ABILITY_STR);
    DelayCommand(2.0, AddItemProperty(DURATION_TYPE_PERMANENT, ipAb, oWeapon));
    DelayCommand(2.0, AddItemProperty(DURATION_TYPE_PERMANENT, ipVis, oWeapon));

    StoreCameraFacing();
    SetCameraMode(oPC, CAMERA_MODE_TOP_DOWN);
    AssignCommand(oPC, SetCameraFacing(90.0, 20.0, 50.0, CAMERA_TRANSITION_TYPE_MEDIUM));
    DelayCommand(5.0, RestoreCameraFacing());
    effect eVis = EffectVisualEffect(VFX_IMP_HARM);
    DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC));

}

