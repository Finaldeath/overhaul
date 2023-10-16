//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Take the mummified hand and give the pc gold.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: April 10, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = (GetPCSpeaker());
    object oHand = (GetLocalObject(OBJECT_SELF,"MUMMIFIEDHAND"));
    GiveGoldToCreature(GetPCSpeaker(),500);
    DestroyObject(oHand);
}
