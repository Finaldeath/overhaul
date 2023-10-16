//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sets that PC extorted gold from Fiona and
     gives gold to pc.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: March 17, 2003
//:://////////////////////////////////////////////
void main()
{
    SetLocalInt(GetModule(),"X1_FIONAEXTORTED",1);
    GiveGoldToCreature(GetPCSpeaker(),200);
}
