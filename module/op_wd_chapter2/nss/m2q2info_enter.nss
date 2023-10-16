//::///////////////////////////////////////////////
//:: Entered
//:: m2q2info_enter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The nymph initiates dialiog with any PC
    entering her space.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 5, 2002
//:://////////////////////////////////////////////

void main()
{
    object oEntered = GetEnteringObject();
    object oNymph = GetObjectByTag("M2Q2FNymph");

    if (GetIsPC(oEntered) &&
        GetLocalInt(oEntered,"M2Q2FNYMPH_TALK") == 0 &&
        IsInConversation(oNymph) == FALSE)
    {
        AssignCommand(oNymph,ClearAllActions());
        AssignCommand(oNymph,ActionStartConversation(oEntered));
    }
}
