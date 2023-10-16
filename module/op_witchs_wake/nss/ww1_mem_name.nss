//::///////////////////////////////////////////////
//:: Witchwork 1: Memorial, Signing Name
//:: WW1_Mem_Name.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Records the player's name as a custom token
     for use in the memorial.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 18, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    string sName = GetName(oPC);

    SetCustomToken(9388, " "+sName+".");
    SetLocalInt(OBJECT_SELF, "iNameComplete", 1);
}
