//::///////////////////////////////////////////////
//:: Entered
//:: m2q2info_enter2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Setara initiates dialiog with any PC
    entering her space.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 5, 2002
//:://////////////////////////////////////////////

void main()
{
    object oEntered = GetEnteringObject();
    object oSetara = GetObjectByTag("M2Q2JSetara");

    if (GetIsPC(oEntered) &&
        GetLocalInt(oEntered,"NW_L_M2SetaraInfo") == 0 &&
        IsInConversation(oSetara) == FALSE)
    {
        AssignCommand(oEntered,ClearAllActions());
        AssignCommand(oSetara,ClearAllActions());
        AssignCommand(oSetara,ActionStartConversation(oEntered));
    }
}
