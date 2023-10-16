//::///////////////////////////////////////////////
//:: Alias Vote Trigger
//:: q2_trg_aliasvote
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Alias comes to tell the PC about a vote
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////
#include "inc_remeffect"

void main()
{
/*  This should occur when the PC gains another vote after the second.
Have a few triggers placed in common areas
that the PC will have to cross fairly frequently.
Have the triggers check how many votes the pc has,
and if the vote has been postponed on this number of votes.
ie. Alias will only do this once when the third vote is gained, etc.

//The PC can only postpone the vote 3 times,
so the most votes they should be able to get is six.
After the sixth vote is gained, the PC will have to go to the election.

//When this is triggered, freeze the PC's movement,
have Alias jump to the PC and initiate conversation.
WE don't want the PC to miss the fact that she is there.*/

    object oPC = GetFirstPC();
    object oAlias = GetObjectByTag("q2_alias");
    int nVotes = GetLocalInt(oPC,"OS_PC_VOTES");
    int nAlias = GetLocalInt(oAlias,"OS_ALIAS_VOTE");

    AssignCommand(GetArea(oAlias),
        DelayCommand(IntToFloat(Random(234)),
            ActionSpeakStringByStrRef(40499)));

    if(GetEnteringObject()==oPC)
    {
        if(nAlias==10)
        {
            RemovePoly(oPC);
            SetCutsceneMode(oPC, TRUE);
            AssignCommand(oPC,ClearAllActions(TRUE));
            AssignCommand(oAlias,JumpToObject(oPC));
            AssignCommand(oAlias,ActionStartConversation(oPC));
        }
        else if(nVotes>2 && nAlias==0)
        {
            if(nVotes==3
                && GetLocalInt(oAlias,"OS_ALIAS_VOTE3")==0)
            {
                RemovePoly(oPC);
                SetCutsceneMode(oPC, TRUE);
                AssignCommand(oPC,ClearAllActions(TRUE));
                SetLocalInt(oAlias,"OS_ALIAS_VOTE3",1);
                SetLocalInt(oAlias,"OS_ALIAS_VOTE",20);
                AssignCommand(oAlias,JumpToObject(oPC));
                AssignCommand(oAlias,ActionStartConversation(oPC));
            }
            else if(nVotes==4
                && GetLocalInt(oAlias,"OS_ALIAS_VOTE4")==0)
            {
                RemovePoly(oPC);
                SetCutsceneMode(oPC, TRUE);
                AssignCommand(oPC,ClearAllActions(TRUE));
                SetLocalInt(oAlias,"OS_ALIAS_VOTE4",1);
                SetLocalInt(oAlias,"OS_ALIAS_VOTE",20);
                AssignCommand(oAlias,JumpToObject(oPC));
                AssignCommand(oAlias,ActionStartConversation(oPC));
            }
            else if(nVotes==5
                && GetLocalInt(oAlias,"OS_ALIAS_VOTE5")==0)
            {
                RemovePoly(oPC);
                SetCutsceneMode(oPC, TRUE);
                AssignCommand(oPC,ClearAllActions(TRUE));
                SetLocalInt(oAlias,"OS_ALIAS_VOTE5",1);
                SetLocalInt(oAlias,"OS_ALIAS_VOTE",20);
                AssignCommand(oAlias,JumpToObject(oPC));
                AssignCommand(oAlias,ActionStartConversation(oPC));
            }
            else if(nVotes>=6
                && GetLocalInt(oAlias,"OS_ALIAS_VOTE6")==0)
            {
                RemovePoly(oPC);
                SetCutsceneMode(oPC, TRUE);
                AssignCommand(oPC,ClearAllActions(TRUE));
                SetLocalInt(oAlias,"OS_ALIAS_VOTE6",1);
                SetLocalInt(oAlias,"OS_ALIAS_VOTE",20);
                AssignCommand(oAlias,JumpToObject(oPC));
                AssignCommand(oAlias,ActionStartConversation(oPC));
            }
        }
    }
}
