//::///////////////////////////////////////////////
//:: Shadovar Encounter (OnExit)
//:: Ex_Shadovar_Enc.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Reactivate the encounter OnExit.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 18, 2003
//:://////////////////////////////////////////////

void main()
{
    //Removing this to see how it plays without the respawning.
    SetEncounterActive(TRUE, OBJECT_SELF);
}
