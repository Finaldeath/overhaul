//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Mark Character as a thief. Give 10 gold.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: April 9, 2003
//:://////////////////////////////////////////////
void main()
{
    SetLocalInt(GetPCSpeaker(),"X1_HPSPOKE",20);
    GiveGoldToCreature(GetPCSpeaker(),10);
}
