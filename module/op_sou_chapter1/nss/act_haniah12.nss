//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sets that this PC is going to go and speak to
     Szaren again.

*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: March 20, 2003
//:://////////////////////////////////////////////
void main()
{
    SetLocalInt(GetModule(), "X1_THAYQUEST",2);
    SetLocalInt(GetModule(),"HANIAHSPEAK",20);
}
