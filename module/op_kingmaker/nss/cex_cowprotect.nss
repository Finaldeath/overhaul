//::///////////////////////////////////////////////
//:: cex_cowprotect
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If a Cow or Chicken is marked as completeing
    the Gauntlet send them to the exit at the
    end of their conversation.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Hayward
//:: Created On: Feb 2005
//:://////////////////////////////////////////////
void main()
{
    object oSelf = OBJECT_SELF;
    object oWay1 = GetNearestObjectByTag("q3_map_exit");
    int iDone;

    iDone = GetLocalInt(oSelf, "q3_trg_cowexit");

    // if the cow or chicken has entered the trigger but been
    // interupted by the PC, keep them walking out of the area
    if (iDone == TRUE)
    {
        AssignCommand(oSelf, ClearAllActions());
        AssignCommand(oSelf, ActionMoveToObject(oWay1));
        AssignCommand(oSelf, ActionDoCommand(DestroyObject(OBJECT_SELF)));
    }
}

