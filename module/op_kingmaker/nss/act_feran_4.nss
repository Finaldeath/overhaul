//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Give 1000 gold, give 500 xp,
     set Feran not talking to PC.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Sept. 2003
//:://////////////////////////////////////////////
void main()
{
    SetLocalInt(OBJECT_SELF,"OS_FERANDRINKING",30);
    GiveXPToCreature(GetFirstPC(),500);
    GiveGoldToCreature(GetFirstPC(),1000);
}
