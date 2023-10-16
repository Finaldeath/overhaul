//::///////////////////////////////////////////////
//:: Name hx_gen_heartbeat
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will cause damage to the player for
     being in the cold. This is preventable by
     being near a campfire.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: July 25, 2003
//:://////////////////////////////////////////////
#include "hx_inc_ring"
void main()
{
    object oPC = GetFirstPC();

    HXDoColdDamage(0);

    if(GetIsObjectValid(oPC))
    {
        if(GetArea(oPC) == OBJECT_SELF)
        {
            HXSpawnCreatures(oPC, 100.0);
        }
        oPC = GetNextPC();
    }
}
