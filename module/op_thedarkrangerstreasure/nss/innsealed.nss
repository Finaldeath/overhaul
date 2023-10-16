//::///////////////////////////////////////////////
//:: Inn Sealed Door Transition Script
//:: InnSealed.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Prevents anyone from leaving the inn once the
    module has been completed.
*/
//:://////////////////////////////////////////////

void main()
{
    int iInnSealed = GetLocalInt(GetModule(), "InnSealed");

    if (iInnSealed == FALSE)
    {
        object oClicker = GetClickingObject();
        object oTarget = GetTransitionTarget(OBJECT_SELF);
        location lLoc = GetLocation(oTarget);

        AssignCommand(oClicker,JumpToLocation(lLoc));
    }

    else
    {
        SpeakString("You are too weary from your adventures to venture out again. Talk to Talias and ask to stay the night.");
    }
}
