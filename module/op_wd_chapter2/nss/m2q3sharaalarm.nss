//::///////////////////////////////////////////////
//:: Conversation
//:: m2q3SharaAlarm
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Shara sounds the alarm.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 22, 2001
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(GetModule(),"NW_G_WanevAlarm") == 0)
    {
        SetLocalInt(GetModule(),"NW_G_WanevAlarm",1);
        SetLocalObject(GetArea(OBJECT_SELF),"NW_A_WanevGong",OBJECT_SELF);
    }
}
