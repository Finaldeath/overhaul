//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     If see sister, plot is complete
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF,"NW_L_DOONCE") == 0)
    if (GetIsObjectValid(GetNearestObjectByTag("M4Q01B08LEES")) == TRUE)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_DOONCE",1);
        SetLocalInt(GetModule(),"NW_G_M4Q01PLOTLEESA_RESCUE",1);
        SetLocalInt(GetLocalObject(GetModule(), "NW_G_M4Q01PLOTLEESA_SAVIOUR"),"NW_G_M4Q01PLOTLEESA_RESCUE",2);

    }
}
