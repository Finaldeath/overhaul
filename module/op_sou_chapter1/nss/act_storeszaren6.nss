//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Take the dragon tooth and give the pc gold.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: April 10, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = (GetPCSpeaker());
    object oTooth = (GetLocalObject(OBJECT_SELF,"DRAGONTOOTH"));
    GiveGoldToCreature(GetPCSpeaker(),500);
    DestroyObject(oTooth);
}
