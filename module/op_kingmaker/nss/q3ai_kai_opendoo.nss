//::///////////////////////////////////////////////
//:: Open Door
//:: q3ai_kai_opendoo
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Opens the fourth door in the cave
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void main()
{
    object oDoor = GetObjectByTag("q3ai_door2");
    SetLocked(oDoor,FALSE);
}