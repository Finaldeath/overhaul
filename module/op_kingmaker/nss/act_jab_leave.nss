//::///////////////////////////////////////////////
//:: act_jab_leave
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Jaboli leaves the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

#include "x0_i0_henchman"
void main()
{
    QuitHenchman(GetPCSpeaker());

    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,
        EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_ACID),
        GetLocation(OBJECT_SELF));

    DelayCommand(0.5,DestroyObject(OBJECT_SELF));
}
