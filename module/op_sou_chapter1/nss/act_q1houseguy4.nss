//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Set that PC threatened him for gold
     and give 1 gold to PC.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On:Feb 25, 2002
//:://////////////////////////////////////////////
void main()
{
    SetLocalInt(GetPCSpeaker(),"X1_HOUSEGUYROBBED",10);
    GiveGoldToCreature(GetPCSpeaker(),1);
}
