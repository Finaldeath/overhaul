//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Take the mask and give the pc gold.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: April 10, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = (GetPCSpeaker());
    object oMask = (GetLocalObject(OBJECT_SELF,"THEMASK"));
    GiveGoldToCreature(GetPCSpeaker(),1200);
    DestroyObject(oMask);
}
