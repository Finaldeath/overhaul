//::///////////////////////////////////////////////
//:: Name
//:: FileName q2b_death_garg1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
When this gargoyle is destroyed , if gargoyles 2 and
3 are no longer valid, then unlock the door, q2b06_door
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On: Nov 5/02
//:://////////////////////////////////////////////

void main()
{   //Both of the other gargoyles must be destroyed for this to be true
    if (!GetIsObjectValid(GetObjectByTag("q2b_garg_2")) && !GetIsObjectValid(GetObjectByTag("q2b_garg_3")))
        SetLocked(GetObjectByTag("q2b06_door"), FALSE);
}
