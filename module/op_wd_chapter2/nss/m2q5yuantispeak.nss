//::///////////////////////////////////////////////
//:: Entered
//:: m2q5yuantispeak
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The Yuan-ti will start conversation with any
    PC that enters.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 25, 2002
//:://////////////////////////////////////////////

void main()
{
    object oEntered = GetEnteringObject();
    object oYuanti = GetObjectByTag("M2Q05CYUANTI");

    if (GetIsPC(oEntered) &&
       !IsInConversation(oYuanti) &&
       !GetIsInCombat(oYuanti))
    {
        AssignCommand(oEntered,ClearAllActions());
        AssignCommand(oYuanti,ActionStartConversation(oEntered));
    }
}
