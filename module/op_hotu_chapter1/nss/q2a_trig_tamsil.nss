//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Start Tamsil's first conversation with the PC
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On: Nov 8/02
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == TRUE)
    {
        object oTamsil = GetObjectByTag("Tamsil");
        AssignCommand(oTamsil, ActionStartConversation(oPC, "q2atamsil"));
    }
}
