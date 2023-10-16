//::///////////////////////////////////////////////
//:: m1q2B Sedgewick Door Lever
//:: m1q2blever1_b
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Pulling the lever outside of Sedgewick's door
    opens his door as well as that of his guard.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Nov 21, 2001
//:://////////////////////////////////////////////

void main()
{
    object oSedgewickDoor = GetNearestObjectByTag("m1q2_SedgeDoor");
    object oSedgewickGuardDoor = GetNearestObjectByTag("m1q2_SedgeGuardDoor");

    if(GetIsObjectValid(oSedgewickDoor))
    {
        AssignCommand(oSedgewickDoor,ActionOpenDoor(oSedgewickDoor));
    }

    if(GetIsObjectValid(oSedgewickGuardDoor))
    {
        AssignCommand(oSedgewickGuardDoor,ActionOpenDoor(oSedgewickGuardDoor));
    }
}
