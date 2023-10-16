//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Gives PC 10 gold and sets that an advance has
     been paid.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb 18, 2003
//:://////////////////////////////////////////////
void main()
{
    GiveGoldToCreature(GetPCSpeaker(),10);
    SetLocalInt(GetModule(),"XP1_Q1SZARENADVANCE",10);
}
