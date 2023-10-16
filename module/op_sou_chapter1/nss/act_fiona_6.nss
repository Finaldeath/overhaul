//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Fiona takes magical antlers and gives PC 150 gold.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: March 6, 2003
//:://////////////////////////////////////////////
void main()
{
    object oAntlers = (GetObjectByTag("q1foot_horns"));
    DestroyObject(oAntlers);
    GiveGoldToCreature(GetPCSpeaker(),150);
}
