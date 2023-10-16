//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     PC is working for J'Nah.
     Give him Phylactary
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Mar 12, 2003
//:://////////////////////////////////////////////
void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(GetModule(),"X1_JNAHPLOT",10);
    object oPhylac = GetItemPossessedBy(OBJECT_SELF, "x1_ice_phylac");
    DestroyObject(oPhylac);
    CreateItemOnObject("x1_ice_phylac", oPC);
}
