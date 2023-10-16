//::///////////////////////////////////////////////
//:: act_ldoor_jump
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script jumps the PC to the Hero PC
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 17/03
//:://////////////////////////////////////////////
#include "x0_inc_portal"

void main()
{
    PortalJumpToHero(GetPCSpeaker());
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_DISPEL_GREATER), GetLocation(GetObjectByTag("x2_deathdoor")));
    DestroyObject(OBJECT_SELF, 0.5);
}
