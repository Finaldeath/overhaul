//::///////////////////////////////////////////////
//:: Name q2a_ent_grovtrig
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
//If Grovel the goblin has been sent up to the inn - have him initiate
    //conversation with the PC until he has been dealt with (his variable
    //gets changed in his conversation when this happens..
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Oct 3/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;

    //If Grovel the goblin has been sent up to the inn - have him initiate
    //conversation with the PC until he has been dealt with (his variable
    //gets changed in his conversation when this happens..
    if (GetLocalInt(GetModule(),"Grovel") == 10)
    {

        object oGrovel = GetObjectByTag("q2bgrovel");
        if (GetIsObjectValid(oGrovel) == FALSE)
            return;

        if (IsInConversation(oGrovel) == FALSE)
        {
            AssignCommand(oPC, ClearAllActions(TRUE));
            AssignCommand(oGrovel, ActionStartConversation(oPC));
        }
    }
}
