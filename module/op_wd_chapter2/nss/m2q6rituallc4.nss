//::///////////////////////////////////////////////
//:: Conversation
//:: m2q6RitualLC4
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Set the Aribeth ritual local to 4.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 16, 2001
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(GetArea(OBJECT_SELF),"NW_A_Ritual") < 4)
    {
        SetLocalInt(GetArea(OBJECT_SELF),"NW_A_Ritual",4);
        SignalEvent(GetObjectByTag("M2Q06CARIBETH"),EventUserDefined(600));
        SignalEvent(GetObjectByTag("M2Q06CMORAG"),EventUserDefined(600));
        AssignCommand(GetObjectByTag("M2Q06PPORTAL1"),DelayCommand(5.0,DestroyObject(OBJECT_SELF)));
        AssignCommand(GetObjectByTag("M2Q06PPORTAL2"),DelayCommand(5.0,DestroyObject(OBJECT_SELF)));
        AssignCommand(GetObjectByTag("M2Q06PPORTAL3"),DelayCommand(5.0,DestroyObject(OBJECT_SELF)));
    }
}
