//::///////////////////////////////////////////////
//:: KraegenInit
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: June 14, 2002
//:://////////////////////////////////////////////

void main()
{
    object oEntered = GetEnteringObject();
    object oKraegen = GetObjectByTag("Kraegen");

    if (GetIsPC(oEntered) && IsInConversation(oKraegen) == FALSE)
    {
        AssignCommand(oEntered,ClearAllActions());
        AssignCommand(oKraegen,ActionStartConversation(oEntered));
    }
}
