//::///////////////////////////////////////////////
//:: Islund Greets PC
//:: 2q6_islundgreet
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Islund will speak a one liner to the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 12, 2002
//:://////////////////////////////////////////////
void main()
{
    object oCapt = GetObjectByTag("2Q6A_GateCapt");

    int nGreet = GetLocalInt(oCapt, "NW_2Q6_ISLUND_GREET");

    if(GetIsObjectValid(oCapt) && nGreet == 0)
    {
        AssignCommand(oCapt, ActionStartConversation(oCapt));
        DestroyObject(OBJECT_SELF, 0.25);
    }
}
