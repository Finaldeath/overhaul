//::///////////////////////////////////////////////
//:: Name hx_fire_reset
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Resets the fire starting variable on the PC.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 15, 2003
//:://////////////////////////////////////////////

void main()
{
   object oPC = GetPCSpeaker();

   // Reset a variable on the PC so we know what to do if they abort the dialogue.
   //SetLocalInt(oPC, "HX_PC_STARTED_FIRE", 0);
   //AssignCommand(oPC, ClearAllActions(TRUE));
}
