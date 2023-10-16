//::///////////////////////////////////////////////
//:: H2 Aribeth Cave Entrance (AreaTransitionClick)
//:: H2_ATC_IceCave.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Area transition is only available once the
     Scrivener Quest is complete.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 11, 2003
//:://////////////////////////////////////////////

void main()
{
    object oClicker = GetClickingObject();
    int bQuestComplete = GetLocalInt(GetModule(), "bScrivenerQuestComplete");

    //If Scrivener quest is complete, handle area transition as normal.
    if (bQuestComplete == TRUE)
    {
        //Copied from generic area transition script.
        object oTarget = GetTransitionTarget(OBJECT_SELF);
        SetAreaTransitionBMP(AREA_TRANSITION_RANDOM);
        AssignCommand(oClicker,JumpToObject(oTarget));
    }
    //Otherwise give an error message.
    else
    {
        AssignCommand(oClicker, ClearAllActions(TRUE));
        ActionStartConversation(oClicker);
    }
}
