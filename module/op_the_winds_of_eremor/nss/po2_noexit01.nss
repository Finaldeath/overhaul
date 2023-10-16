//::///////////////////////////////////////////////
//:: PO2_NoExit01
//:: Pre-Order 2: No Exit 01
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script is placed on the area transition
    where the player spawns into the module,
    informing them that they can't go back.
*/
//:://////////////////////////////////////////////

void main()
{
    //When clicked, say text bubble.
    ActionStartConversation(OBJECT_SELF);
}
