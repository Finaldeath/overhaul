//::///////////////////////////////////////////////
//:: Used
//:: m2q3Underwater
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    A conversation starts that allows the PC to
    try to swim through the underwater passage.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 19, 2001
//:://////////////////////////////////////////////

void main()
{
    ActionStartConversation(GetLastUsedBy(),"M2Q3B07PASSAGE");
}
