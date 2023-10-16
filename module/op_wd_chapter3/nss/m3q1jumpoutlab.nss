//::///////////////////////////////////////////////
//:: Jump person out of lab
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:       Brent
//:: Created On:       November 2001
//:://////////////////////////////////////////////

void main()
{
 object oEntering = GetEnteringObject();
 if (GetIsObjectValid(oEntering) == TRUE && GetIsPC(oEntering) == TRUE)
 {
     AssignCommand(oEntering, ClearAllActions());
     AssignCommand(oEntering, JumpToObject(GetObjectByTag("M3Q1A09OutLab")));
 }
}
