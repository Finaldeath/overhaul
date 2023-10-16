//::///////////////////////////////////////////////
//:: Name hx_durn_effects
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will make some visual effects for Durnan's
     magical barrier.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Sept 8, 2003
//:://////////////////////////////////////////////
#include "x2_inc_toollib"
void main()
{
    if(GetArea(GetFirstPC()) == GetArea(OBJECT_SELF))
    {
        TLVFXPillar(VFX_FNF_PWSTUN, GetLocation(OBJECT_SELF), 4, 0.1, 6.0, -2.0);
        //DelayCommand(3.0, TLVFXPillar(VFX_FNF_PWSTUN, GetLocation(OBJECT_SELF), 4, 0.1, 0.0, 2.0));
    }
}
