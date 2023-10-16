//::///////////////////////////////////////////////
//:: M2Q2E_INPROGRESS.NSS
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Tests to see if anyone else is in the druid circle.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May
//:: Created On: February 7, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    if(GetLevelByClass(CLASS_TYPE_DRUID,GetPCSpeaker())>=1)
    {
        if(GetLocalInt(OBJECT_SELF,"NW_M2Q2E_LFIGHT")==TRUE)
        {
            return TRUE;
        }
    }
    return FALSE;
}
