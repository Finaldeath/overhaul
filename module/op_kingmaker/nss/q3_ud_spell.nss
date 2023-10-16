//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: q3_ud_spell
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    User defined events for Duergar spell statue
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 305) // DISTURBED
    {
        if(GetLocalInt(OBJECT_SELF,"OS_DUERGAR_SPELL")==0)
        {
            object oWay = GetObjectByTag("q3_way_duerfire");
            location lWay = GetLocation(oWay);
            effect eFire = EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_FIRE);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eFire,lWay);
            object oFire = CreateObject(OBJECT_TYPE_CREATURE,"q3_duerfire",lWay);
            AssignCommand(oFire,DetermineCombatRound());
            SetLocalInt(OBJECT_SELF,"OS_DUERGAR_SPELL",10);
        }
    }
}

