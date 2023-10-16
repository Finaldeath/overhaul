//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sets that PC successfully persuaded Fiona for
     discount already.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb 21, 2003
//:://////////////////////////////////////////////
void main()
{
    SetLocalInt(GetPCSpeaker(),"XP1_Q1FIONAHELMCHEAP",20);
    SetLocalInt(OBJECT_SELF, "nHelmPrice", 500);
}
