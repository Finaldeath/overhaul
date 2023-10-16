//::///////////////////////////////////////////////
//:: Name tri_durnanspeak
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This sets Durnan and pc to clear actions and then forces
     Durnan to start conversation
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Sept. 12/2002
//:://////////////////////////////////////////////
void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC)==TRUE )
    {
        object oNPC = GetObjectByTag("q2adurnan");

        {
            AssignCommand(oPC,ClearAllActions());
            AssignCommand(oNPC,ClearAllActions());
            AssignCommand(oNPC,ActionStartConversation(oPC));
        }
    }
}
