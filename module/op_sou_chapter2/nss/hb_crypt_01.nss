//::///////////////////////////////////////////////
//:: Crypt Tower, Level 1 (Heartbeat)
//:: Hb_Crypt_01.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handle the Dread Sarcophagus spawns
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 12, 2003
//:://////////////////////////////////////////////

void main()
{
    //Do the following only if there is a PC in the area
    object oRefPoint = GetObjectByTag("Reference_Crypt_01");
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oRefPoint);
    if (oPC != OBJECT_INVALID)
    {
        //Loop through all Dread Sarcophagi in the area
        int iNearest = 1;
        object oDread = GetNearestObjectByTag("Dread_Sarcophagus", oPC, iNearest);

        while (oDread != OBJECT_INVALID)
        {
            //Apply VFX if it hasn't been applied yet
            int bDreadVFX = GetLocalInt(oDread, "bDreadVFX");
            if (bDreadVFX == FALSE)
            {
                effect eDreadVFX = EffectVisualEffect(VFX_DUR_SPELLTURNING);
                ApplyEffectToObject(DURATION_TYPE_PERMANENT, eDreadVFX, oDread);
                SetLocalInt(oDread, "bDreadVFX", TRUE);
            }

            //25% chance to Spawn in an undead beside the Sarcophagus. Never let
            //the total zombie count exceed 15.
            int iZombieCount = GetLocalInt(GetModule(), "iZombieCount_Crypt01");
            int iPercent = Random(100)+1;
            if (iZombieCount <= 15 && iPercent <= 25)
            {
                location lDread = GetLocation(oDread);
                effect eSummonVFX = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_1);
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eSummonVFX, lDread);
                object oUndead = CreateObject(OBJECT_TYPE_CREATURE, "Dread_Zombie", lDread);
                AssignCommand(oUndead, ActionMoveToObject(oPC));
                SetLocalInt(GetModule(), "iZombieCount_Crypt01", iZombieCount+1);
            }

            //Reseed the while loop
            iNearest++;
            oDread = GetNearestObjectByTag("Dread_Sarcophagus", oPC, iNearest);
        }
    }
}
