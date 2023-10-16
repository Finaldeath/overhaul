//::///////////////////////////////////////////////
//:: Conversation
//:: NW_TAV_BarM_PC0.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 7, 2001
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF,"NW_L_PCCustomer",0);
    if (GetIsObjectValid(GetLocalObject(OBJECT_SELF,"NW_L_Customer2")))
    {
        SetLocalObject(OBJECT_SELF,"NW_L_Customer",GetLocalObject(OBJECT_SELF,"NW_L_Customer2"));
        SetLocalObject(OBJECT_SELF,"NW_L_Customer2",OBJECT_INVALID);
    }
    else
    {
        SetLocalInt(OBJECT_SELF,"NW_L_HaveDrink",0);
        SetLocalObject(OBJECT_SELF,"NW_L_Customer",OBJECT_INVALID);
    }
}
