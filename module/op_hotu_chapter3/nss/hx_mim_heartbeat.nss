//::///////////////////////////////////////////////
//:: Name hx_mim_heartbeat
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
#include "mimic_inc"
void main()
{
    object oPC = GetFirstPC();
    object oMimic = GetObjectByTag("hx_mimic");

    HXDoColdDamage(0);

    if(GetMimicAI(oMimic) && GetArea(oMimic) == OBJECT_SELF)
    {
        if(GetIsObjectValid(oPC))
        {
            if(GetArea(oPC) == OBJECT_SELF)
            {
                HXSpawnCreatures(oPC, 150.0);
            }
            oPC = GetNextPC();
        }
    }
}
