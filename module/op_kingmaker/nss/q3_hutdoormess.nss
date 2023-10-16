//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Pop-up message when door to hut in goblin caves
     doesn't open.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: March 12, 2004
//:://////////////////////////////////////////////
void main()
{
    object oPC = GetLastDisturbed();
    AssignCommand(oPC, SpeakString("You find nothing in a quick search of the hut."));
}
