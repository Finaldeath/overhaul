//::///////////////////////////////////////////////
//:: Wise Wind (UserDefined)
//:: UD_WiseWind.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handle the VFX and Dimension Door abilities
     of the Wise Wind.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 31, 2003
//:://////////////////////////////////////////////
#include "nw_i0_generic"

void main()
{
    int iUDNum = GetUserDefinedEventNumber();

    //User-Defined OnSpawn (1000)
    if (iUDNum == 1000)
    {
        //Apply Wind VFX
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        if (oPC != OBJECT_INVALID)
        {
            effect eVFX = EffectVisualEffect(VFX_IMP_DOOM);

            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, OBJECT_SELF);
            DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, OBJECT_SELF));
            DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, OBJECT_SELF));
            DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, OBJECT_SELF));
            DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, OBJECT_SELF));
            DelayCommand(5.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, OBJECT_SELF));
            DelayCommand(6.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, OBJECT_SELF));
        }
    }
    //User-Defined OnHeartbeat (1001)
    if (iUDNum == 1001)
    {
        //Apply Wind VFX
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        if (oPC != OBJECT_INVALID)
        {
            effect eVFX = EffectVisualEffect(VFX_IMP_DOOM);

            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, OBJECT_SELF);
            DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, OBJECT_SELF));
            DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, OBJECT_SELF));
            DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, OBJECT_SELF));
            DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, OBJECT_SELF));
            DelayCommand(5.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, OBJECT_SELF));
            DelayCommand(6.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, OBJECT_SELF));
        }
    }

    //User-Defined OnPerceive (1002)
    if (iUDNum == 1002)
    {

    }

    //User-Defined OnAttacked (1005)
    if (iUDNum == 1005)
    {

    }

    //User-Defined OnDamaged (1006)
    if (iUDNum == 1006)
    {

    }

    //User-Defined OnDeath (1007)
    if (iUDNum == 1007)
    {
        //Create sparkly to mark the item drop.
        location lLoc = GetLocation(OBJECT_SELF);
        CreateObject(OBJECT_TYPE_PLACEABLE, "plc_magicwhite", lLoc, FALSE, "WiseWind_Sparkly");
    }

    //User-Defined OnDisturbed (1008)
    if (iUDNum == 1008)
    {

    }

    //User-Defined OnCombatRoundEnd (1003)
    if (iUDNum == 1003)
    {
        // 50% chance of jumping
        if (Random(100) < 50)
        {
            //Pick a jump target.
            int iTarget = Random(9)+2;
            object oTarget = GetNearestObjectByTag("WiseWindTarget", OBJECT_SELF, iTarget);

            //Jump
            effect eVFX = EffectVisualEffect(VFX_FNF_SUMMON_UNDEAD);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFX, OBJECT_SELF);
            ClearAllActions();
            DelayCommand(0.3,ActionJumpToObject(oTarget));
            DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFX, OBJECT_SELF));
            DelayCommand(0.5, DetermineCombatRound());
        }
    }

    //User-Defined OnDialog (1004)
    if (iUDNum == 1004)
    {

    }

    return;
}
