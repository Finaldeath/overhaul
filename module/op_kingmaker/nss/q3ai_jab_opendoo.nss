//::///////////////////////////////////////////////
//:: Open Door
//:: q3ai_jab_opendoo
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Opens the third door in the cave
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void main()
{
    object oDoor = GetObjectByTag("q3ai_door3");
    SetLocked(oDoor,FALSE);
}