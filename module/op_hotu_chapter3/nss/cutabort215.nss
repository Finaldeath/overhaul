//::///////////////////////////////////////////////
//:: Name cutabort205
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     First crystal cutscene abort.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On:Sept 25, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastPCToCancelCutscene();
    object oCrystal = GetObjectByTag("hx_crystal_2");

    AssignCommand(oPC, ClearAllActions(TRUE));
    AssignCommand(oPC, ActionJumpToObject(oCrystal));
}
