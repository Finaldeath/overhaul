//::///////////////////////////////////////////////
//:: Used
//:: m2q3WanevAlarm
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the gong is sounded the entire tower goes
    hostile.
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
        ActionStartConversation(OBJECT_SELF);
        SetLocalObject(GetArea(OBJECT_SELF),"NW_A_WanevGong",OBJECT_SELF);
    }
}
