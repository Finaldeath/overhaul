//::///////////////////////////////////////////////
//:: Name pla_gotoinn
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    start conversation to teleport the pc to the
    well room of the inn
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Sept. 12/2002
//:://////////////////////////////////////////////
void main()
{
    object oPC = GetLastUsedBy();
    AssignCommand(oPC, ClearAllActions(TRUE));
    AssignCommand(oPC, PlaySound("as_cv_bell1"));

    ActionStartConversation(oPC,"q2b01rope");
}
