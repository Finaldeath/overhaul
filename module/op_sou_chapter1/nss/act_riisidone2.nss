//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sets a local variable that says Riisi has spoken
     to this pc, and fetched the items and tells Riisi
     to randomwalk
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb 03, 2003
//:://////////////////////////////////////////////
void main()
{
    SetLocalInt(GetModule(),"XP1_RIISISPEAK",99);
    //ActionRandomWalk();

}
