//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Reaching into the mirror retrieve's its treasure
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 14/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    OpenInventory(OBJECT_SELF, oPC);
}
