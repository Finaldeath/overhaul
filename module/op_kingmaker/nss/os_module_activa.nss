//::///////////////////////////////////////////////
//:: Module On Item Activate
//:: os_module_activa
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Module On Item Activate script for Kingmaker
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void main()
{
    object oItem = GetItemActivated();
    if(GetTag(oItem)=="q3_grain")
    {
        object oPC = GetFirstPC();
        object oArea = GetArea(oPC);
        object oGord = GetObjectByTag("q2_thegord");
        if(GetTag(oArea)=="q3j"
            && GetLocalInt(GetModule(), "OS_THEGORD_COWS")<30)
        {
            location lPC = GetLocation(oPC);
            object oGrain = CreateObject(OBJECT_TYPE_PLACEABLE,"q3_plc_grain",lPC);
            SetLocalObject(oArea,"OS_GRAIN",oGrain);
            event eGrain = EventUserDefined(303);
            // sends the cow and chicken looking for the grain
            object oCow = GetObjectByTag("q3_cow");
            int nCow = GetLocalInt(oCow,"OS_FOLLOW");

            if(nCow==0)
            {
                SetLocalInt(oCow,"OS_FOLLOW",10);
            }
            if(GetIsObjectValid(oCow)
                && nCow<20)
            {
                SignalEvent(oCow,eGrain);
            }

            object oChicken = GetObjectByTag("q3_chicken");
            SetLocalInt(oChicken,"OS_FOLLOW",10);
            if(GetIsObjectValid(oChicken))
            {
                SignalEvent(oChicken,eGrain);
            }
        }
    }
}
