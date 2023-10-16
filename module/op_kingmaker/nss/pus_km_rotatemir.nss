//::///////////////////////////////////////////////
//:: Start a conversation with the bracket from the mirror
//:: pus_km_rotatemir
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    PC tries to talk to the mirror but since it get destroyed
    we need to actually start a conversation with the bracket
    under the mirror.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: June 2004
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    object oBracket = GetObjectByTag("rotate_bracket_a");

    // Start the conversation
    AssignCommand(oPC, ClearAllActions(TRUE));

    DelayCommand(0.5, AssignCommand(oBracket,
        ActionStartConversation(oPC)));
}
